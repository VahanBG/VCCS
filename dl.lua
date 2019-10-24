local argv = {...}

local usage = "Usage:\n" .. shell.getRunningProgram() .. " <url> <filename> [--overwrite]"

if #argv < 2 then
	print(usage)
	return
end

local options = {}

local args = {}

for i = 1, #argv do
	if string.sub(argv[i], 1, 1) == '-' then
		options[#options + 1] = string.sub(argv[i], 2, #argv[i])
	else
		args[#args + 1] = argv[i]
	end
end

if #args > 2 then
	print(usage)
	return
end

local overwrite = false

for i = 1, #options do
	if string.sub(options[i], 1, 1) == '-' then
		if string.lower(string.sub(options[i], 2, #options[i])) == "overwrite" then
			overwrite = true
		else
			print(usage)
			return
		end
	else
		if string.lower(string.sub(options[i], 1, 1)) == 'o' then
			overwrite = true
		else
			print(usage)
			return
		end
	end
end

local http_handle = http.get(args[1])

if not http_handle then
	error("dl: Could not reach file")
end

if fs.exists(args[2]) and (not overwrite) then
	write("dl: File with this name already exists. Overwrite \"" .. args[2] .. "\"? ")
	local input = string.lower(read())
	if input ~= 'y' and input ~= "yes" then
		http_handle.close()
		return
	end
end

local sw = fs.open(args[2], 'w')
sw.write(http_handle.readAll())
sw.close()