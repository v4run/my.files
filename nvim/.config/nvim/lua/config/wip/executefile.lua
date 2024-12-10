local exec_commands = {
	["rust"] = "!cargo run --release",
	["go"] = "!go run %",
	["python"] = "!python %",
	["javascript"] = "!node %",
	["c"] = "!clang -o /tmp/a.out % && /tmp/a.out",
	["cpp"] = "!clang++ -std=c++20 -o /tmp/a.out % && /tmp/a.out",
}
local function exec_file()
	local filetype = vim.o.filetype
	if exec_commands[filetype] then
		vim.cmd(exec_commands[filetype])
	end
end
vim.api.nvim_create_user_command("ExecFile", exec_file, {})
vim.keymap.set("n", "<localleader>e", ":ExecFile<CR>", { desc = "Execute the current file with corresponding program" })

local test_commands = {
	["rust"] = "!cargo test --release",
}
local function test_file()
	local filetype = vim.o.filetype
	if test_commands[filetype] then
		vim.cmd(test_commands[filetype])
	end
end
vim.api.nvim_create_user_command("TestFile", test_file, {})
vim.keymap.set(
	"n",
	"<localleader>t",
	":TestFile<CR>",
	{ desc = "Run the test for the current file with corresponding program" }
)
