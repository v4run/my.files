require("nvim-tree").setup({
	hijack_cursor = true,
	prefer_startup_root = true,
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = {},
	},
	on_attach = "disable", -- function(bufnr). If nil, will use the deprecated mapping strategy
	view = {
		adaptive_size = true,
		hide_root_folder = true,
		side = "left",
		signcolumn = "yes",
	},
	renderer = {
		add_trailing = true,
		full_name = false,
		highlight_git = true,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
	},
})
