local argv = {...}

local argc = #argv

local usage = "Usage:\n" .. shell.getRunningProgram() .. "dl <url> <filename> [%-%-overwrite]"

if argc < 2 or argc > 3 then
	error(usage)
end

local overwrite = false

if argc == 3 then
	for i = 1, 3 do
		if (argv[i] == "--overwrite") then
			overwrite = true
			argv.remove(i)
			break
		end
	end
	error(usage)
end

local file_handle = http.get(args[1])

if not file_handle then
	print("dl: Could not get file")
else
	
end