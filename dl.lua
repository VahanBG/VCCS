local argv = {...}

local argc = #argv

local usage = "Usage:\n" .. shell.getRunningProgram() .. "dl <url> <filename> [%-%-overwrite]"

if argc < 2 then
	error(usage)
end

local options = {}

for i = 1, argc do
	if (argv[i] == "--overwrite") then
		overwrite = true
		argv.remove(i)
		break
	end
end

local file_handle = http.get(args[1])

if not file_handle then
	print("dl: Could not get file")
else
	
end
