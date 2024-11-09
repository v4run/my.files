require("config.stable.settings")
require("config.stable.lazy")
require("config.stable.keymap")
require("config.stable.highlight")
require("config.stable.pickers")

-- Initialize autocmds
local autocmds = require("config.stable.autocmds")
for group_name, definitions in pairs(autocmds) do
	local auid = vim.api.nvim_create_augroup(group_name, definitions.opts)
	for _, cmd in ipairs(definitions.cmds) do
		local opts = vim.tbl_deep_extend("force", { group = auid }, cmd.opts or {})
		vim.api.nvim_create_autocmd(cmd[1], opts)
	end
end
