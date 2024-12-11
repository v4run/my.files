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
		vim.cmd("highlight WhiteSpace guifg=#121112") -- Override hack
		vim.cmd("highlight CursorLine guibg=#121112") -- Override hack
		vim.cmd("highlight CursorColumn guibg=#121112") -- Override hack
		vim.cmd("highlight ColorColumn guibg=#121112") -- Override hack
		vim.cmd("highlight Visual guibg=#2d2a2e") -- Override hack
		vim.cmd("highlight MsgArea guibg=#040001 guifg=#938f8e") -- Override hack
		vim.cmd("highlight LspInlayHint guibg=none guifg=#434343") -- Override hack
		vim.cmd("highlight CursorLineNr guifg=#ffd866") -- Override hack

		vim.cmd("highlight DiagnosticVirtualTextIconError guifg=#ff6188 guibg=#4f1d2a") -- Override hack
		vim.cmd("highlight DiagnosticVirtualTextIconWarn  guifg=#fc9867 guibg=#4e2e20") -- Override hack
		vim.cmd("highlight DiagnosticVirtualTextIconInfo  guifg=#78dce8 guibg=#274246") -- Override hack
		vim.cmd("highlight DiagnosticVirtualTextIconHint  guifg=#fcfcfa guibg=#4e4c4c") -- Override hack

		vim.cmd("highlight DiagnosticVirtualTextError guifg=#b4445f guibg=#221f22") -- Override hack
		vim.cmd("highlight DiagnosticVirtualTextWarn  guifg=#b26a48 guibg=#221f22") -- Override hack
		vim.cmd("highlight DiagnosticVirtualTextInfo  guifg=#559aa3 guibg=#221f22") -- Override hack
		vim.cmd("highlight DiagnosticVirtualTextHint  guifg=#b2b0af guibg=#221f22") -- Override hack

		vim.cmd("highlight DiagnosticSignWarn  guifg=#b26a48 guibg=none") -- Override hack
		vim.cmd("highlight DiagnosticSignError guifg=#b4445f guibg=none") -- Override hack
		vim.cmd("highlight DiagnosticSignInfo  guifg=#559aa3 guibg=none") -- Override hack
		vim.cmd("highlight DiagnosticSignHint  guifg=#b2b0af guibg=none") -- Override hack
	end,
}
