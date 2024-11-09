return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		hijack_cursor = true,
		view = {
			side = "right",
			preserve_window_proportions = true,
			signcolumn = "no",
			width = "50%",
		},
		renderer = {
			add_trailing = true,
			root_folder_label = function(path)
				return "  " .. vim.fn.fnamemodify(path, ":t")
			end,
			hidden_display = "all",
			highlight_git = "all",
			highlight_diagnostics = "all",
			highlight_opened_files = "all",
			highlight_modified = "all",
			highlight_bookmarks = "all",
			indent_markers = {
				enable = false,
				icons = {
					corner = " ",
					edge = " ",
					item = " ",
					bottom = " ",
					none = " ",
				},
			},
			icons = {
				git_placement = "after",
				padding = " ",
				glyphs = {
					folder = {
						default = "+",
						open = "-",
						empty = "+",
						empty_open = "-",
						symlink = "+",
						symlink_open = "-",
						arrow_closed = "",
						arrow_open = "",
					},
				},
			},
		},
		update_focused_file = {
			enable = true,
		},
		actions = {
			change_dir = {
				global = true,
				restrict_above_cwd = true,
			},
			file_popup = {
				open_win_config = {
					border = "rounded",
				},
			},
			open_file = {
				quit_on_open = true,
			},
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			api.config.mappings.default_on_attach(bufnr)
			vim.keymap.set("n", "-", function(node)
				vim.cmd("cd ..")
				api.tree.change_root_to_parent(node)
			end, opts("Up"))
		end,
	},
}
