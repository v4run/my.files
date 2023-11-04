-- require("gruvbox").setup({
-- 	terminal_colors = true, -- add neovim terminal colors
-- 	undercurl = true,
-- 	underline = true,
-- 	bold = true,
-- 	italic = {
-- 		strings = true,
-- 		emphasis = true,
-- 		comments = true,
-- 		operators = false,
-- 		folds = true,
-- 	},
-- 	strikethrough = true,
-- 	invert_selection = false,
-- 	invert_signs = false,
-- 	invert_tabline = false,
-- 	invert_intend_guides = false,
-- 	inverse = true, -- invert background for search, diffs, statuslines and errors
-- 	contrast = "", -- can be "hard", "soft" or empty string
-- 	palette_overrides = {},
-- 	overrides = {
-- 		SignColumn = { bg = "None" },
-- 	},
-- 	dim_inactive = false,
-- 	transparent_mode = false,
-- })
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd("colorscheme gruvbox")

-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd("colorscheme oxocarbon")

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
		"bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
	}, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
	plugins = {
		bufferline = {
			underline_selected = false,
			underline_visible = false,
		},
		indent_blankline = {
			context_highlight = "default", -- default | pro
			context_start_underline = false,
		},
	},
	---@param c Colorscheme
	override = function(c) end,
})
vim.cmd([[colorscheme monokai-pro]])
