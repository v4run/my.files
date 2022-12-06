local filename = { "filename", path = 3 }
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diagnostics" },
		lualine_c = { filename },
		lualine_x = {},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { filename },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = { "tabs" },
		lualine_b = {
			{
				"buffers",
				mode = 4,
			},
		},
		lualine_x = { "encoding" },
		lualine_y = { "filetype" },
		lualine_z = { "fileformat" },
	},
	extensions = { "nvim-tree" },
})

local function toggle_lualine()
	local config = ll.get_config()
	print(vim.inspect(config))
end

vim.api.nvim_create_user_command("LualineToggle", toggle_lualine, {})
