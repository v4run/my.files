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

local function bind(op, outer_opts)
	outer_opts = outer_opts or { noremap = true, silent = true }
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

M.nmap = bind("n", { noremap = false, silent = true })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.cnoremap = bind("c")
M.onoremap = bind("o")
M.snoremap = bind("s")

return M
