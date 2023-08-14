local Msg = require("noice.ui.msg")
require("noice").setup({
	routes = {
		{
			filter = {
				event = Msg.events.show,
				kind = Msg.kinds.search_count,
			},
			opts = { skip = true },
		},
		{
			filter = {
				event = Msg.events.show,
				find = "written",
			},
			opts = { skip = true },
		},
		{
			filter = {
				event = Msg.events.show,
				find = "Already at newest change",
			},
			opts = { skip = true },
		},
		{
			filter = {
				event = Msg.events.show,
				find = "; before #",
			},
			opts = { skip = true },
		},
		{
			filter = {
				event = Msg.events.show,
				find = "; after #",
			},
			opts = { skip = true },
		},
	},
	views = {
		relative = "editor",
		cmdline_popup = {
			border = {
				style = "shadow", -- "'double'"|"'none'"|"'rounded'"|"'shadow'"|"'single'"|"'solid'"
				padding = { 2, 3 },
			},
			size = {
				width = 60,
			},
			filter_options = {},
			win_options = {
				winblend = 20,
				winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "FloatBorder" },
			},
		},
		popupmenu = {
			relative = "editor",
			size = {
				width = 58,
				height = 10,
			},
			border = {
				style = "none",
				padding = { 0, 1 },
			},
			win_options = {
				winblend = 20,
				winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "FloatBorder" },
			},
		},
	},
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
})
