local M = {}

function M.HasPrefix(str, prefix)
	return string.sub(str, 1, string.len(prefix)) == prefix
end

function M.FileExists(path)
	local file = io.open(path, "r")
	if file then
		io.close(file)
		return true
	end
	return false
end

return M
