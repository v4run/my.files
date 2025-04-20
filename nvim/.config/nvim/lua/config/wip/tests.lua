local test_run_cmds = {
	["go"] = function(cwd, func_name)
		if string.find(func_name, "Test", 1) then
			return "!go -C " .. cwd .. " test -run='^" .. func_name .. "$'"
		end
		print("WARN: Not a valid test function")
		return nil
	end,
}

local function get_current_function_name()
	local node = vim.treesitter.get_node()
	local function_name = ""
	while node do
		if node:type() == "function_definition" or node:type() == "function_declaration" then
			break
		end
		node = node:parent()
	end
	if not node then
		return ""
	end
	for _, value in ipairs(node:field("name")) do
		function_name = vim.treesitter.get_node_text(value, 0)
		break
	end
	return function_name
end

local function run_test_func()
	local filetype = vim.o.filetype
	if test_run_cmds[filetype] then
		local func_name = get_current_function_name()
		local cwd = vim.fn.expand("%:p:h")
		local cmd = test_run_cmds[filetype](cwd, func_name)
		if cmd then
			vim.cmd(cmd)
		end
	else
		print("No handler defined for " .. filetype)
	end
end

vim.api.nvim_create_user_command("RunTestFunc", run_test_func, {})
vim.keymap.set("n", "<localleader>f", ":RunTestFunc<CR>", { desc = "Run the current test function" })
