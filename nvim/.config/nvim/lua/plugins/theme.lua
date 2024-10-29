return {
	"loctvl842/monokai-pro.nvim",
	priority = 1000,
	opts = {
		transparent_background = true,
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
		inc_search = "background", -- underline | background
		background_clear = {
			"float_win",
			"toggleterm",
			"telescope",
			"which-key",
			"renamer",
			"nvim-tree",
		},
		plugins = {},
	},
	init = function()
		vim.cmd.colorscheme("monokai-pro")
		vim.cmd("highlight WhiteSpace guifg=#121212") -- Override hack
		vim.cmd("highlight CursorLine guibg=#121212") -- Override hack
		vim.cmd("highlight Visual guibg=#101010") -- Override hack
	end,
}
