require'nvim-tree'.setup {
	disable_netrw       = true,
	hijack_netrw        = true,
	open_on_setup       = false,
	ignore_ft_on_setup  = {},
	-- auto_close          = false, -- Deprecated
	open_on_tab         = false,
	hijack_cursor       = false,
	update_cwd          = false,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	update_focused_file = {
		enable      = false,
		update_cwd  = false,
		ignore_list = {}
	},
	system_open = {
		cmd  = nil,
		args = {}
	},
	filters = {
		dotfiles = false,
		custom = {}
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = 'left',
		mappings = {
			custom_only = false,
			list = {}
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes"
	},
	trash = {
		cmd = "trash",
		require_confirm = true
	}
}
