require("monokai-pro").setup({
	transparent_background = false,
	terminal_colors = true,
	devicons = true, -- highlight the icons of `nvim-web-devicons`
	styles = {
		comment = { italic = true },
		keyword = { italic = true }, -- any other keyword
		type = { italic = true }, -- (preferred) int, long, char, etc
		storageclass = { italic = true }, -- static, register, volatile, etc
		structure = { italic = true }, -- struct, union, enum, etc
		parameter = { italic = true }, -- parameter pass in function
		annotation = { italic = true },
		tag_attribute = { italic = true }, -- attribute of tag in reactjs
	},
	filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
	-- Enable this will disable filter option
	day_night = {
		enable = false, -- turn off by default
		day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
		night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
	},
	inc_search = "background", -- underline | background
	background_clear = {
		"float_win",
		-- "toggleterm",
		-- "telescope",
		"which-key",
		-- "renamer",
		-- "notify",
		"nvim-tree",
		-- "neo-tree",
	}, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
	---@param c Colorscheme
	override = function(c)
		return {}
	end,
})
vim.cmd([[colorscheme monokai-pro]])
vim.api.nvim_set_hl(0, "lualine_c_normal", { link = "Comment" })
vim.api.nvim_set_hl(0, "CursorColumn", { link = "CursorLine" })
