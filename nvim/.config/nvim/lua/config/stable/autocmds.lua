return {
	harpoon_menu = {
		opts = {},
		cmds = {
			{
				"VimEnter",
				opts = {
					callback = function(--[[ev]])
						local harpoon = require("harpoon")
						if harpoon:list():length() > 0 then
							harpoon.ui:toggle_quick_menu(harpoon:list())
						end
					end,
				},
			},
		},
	},
	terminal_job = {
		opts = {},
		cmds = {
			{
				"TermOpen",
				opts = {
					pattern = "*",
					command = "startinsert",
				},
			},
			{
				"TermOpen",
				opts = {
					pattern = "*",
					command = "setlocal listchars= nonumber norelativenumber",
				},
			},
		},
	},
}
