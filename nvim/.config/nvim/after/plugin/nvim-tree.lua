local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5 -- You can change this too

require("nvim-tree").setup({
	hijack_cursor = true,
	prefer_startup_root = true,
	select_prompts = false,
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = {},
	},
	renderer = {
		root_folder_label = false,
		add_trailing = true,
		full_name = false,
		highlight_git = true,
		highlight_diagnostics = true,
		highlight_modified = "all",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "├",
				none = " ",
			},
		},
		symlink_destination = false,
	},
	view = {
		signcolumn = "no",
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
	},
})
-- vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { link = "NvimTreeNormal" })
