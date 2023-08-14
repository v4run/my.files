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
	},
	views = {
		cmdline_popup = {
			border = {
				style = "none",
				padding = { 2, 3 },
			},
			size = {
				width = 60,
			},
			filter_options = {},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
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
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
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
