local keymap = require("varun.keymap")
local nnoremap = keymap.nnoremap
local dap = require("dap")
local dapui = require("dapui")

-- Auto close and open dap ui on debug events
dap.listeners.after.event_initialized["dapui"] = function()
	dapui.open({})
end
dap.listeners.after.event_terminated["dapui"] = function()
	dapui.close({})
end
dap.listeners.after.event_exited["dapui"] = function()
	dapui.close({})
end

-- DAP key binding
nnoremap("<C-n>n", function()
	dap.continue()
end)
nnoremap("<C-n>b", function()
	dap.toggle_breakpoint()
end)
nnoremap("<C-n>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
nnoremap("<C-n>l", function()
	dap.step_into()
end)
nnoremap("<C-n>h", function()
	dap.step_out()
end)
nnoremap("<C-n>j", function()
	dap.step_over()
end)
nnoremap("<C-n>u", function()
	dapui.toggle({})
end)

require("dap-go").setup()
dapui.setup()
