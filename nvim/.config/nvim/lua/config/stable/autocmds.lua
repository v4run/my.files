return {
	harpoon_menu = {
		opts = {},
		cmds = {},
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
