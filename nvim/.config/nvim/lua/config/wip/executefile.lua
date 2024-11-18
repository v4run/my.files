local commands = {
	["rust"] = "!cargo run",
	["go"] = "!go run %",
	["python"] = "!python %",
	["javascript"] = "!node %",
	["c"] = "!clang -o /tmp/a.out % && /tmp/a.out",
	["cpp"] = "!clang++ -std=c++20 -o /tmp/a.out % && /tmp/a.out",
}
local function exec_file()
	local filetype = vim.o.filetype
	if commands[filetype] then
		vim.cmd(commands[filetype])
	end
end
vim.api.nvim_create_user_command("ExecFile", exec_file, {})
vim.keymap.set("n", "<localleader>e", ":ExecFile<CR>", { desc = "Execute the current file with corresponding program" })
