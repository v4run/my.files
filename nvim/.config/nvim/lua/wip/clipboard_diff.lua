-- add struct tags
local function diff_clipboard()
	-- create new split for diff
	vim.cmd("diffthis")
	vim.cmd("vnew")
	vim.cmd('normal "+p')
	vim.cmd("diffthis")
end

vim.api.nvim_create_user_command("DiffClipboard", diff_clipboard, {})
