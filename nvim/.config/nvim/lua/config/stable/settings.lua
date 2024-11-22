vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.ftplugin_sql_omni_key = "<C-]>"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { tab = "┃ ", space = "۰", trail = "␠" } -- indent guide lines
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.smartindent = true
vim.opt.swapfile = true
vim.opt.laststatus = 3
vim.opt.fillchars = "eob: " -- remove ~ at end of buffer
vim.opt.wrap = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevelstart = 99
vim.opt.autowrite = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.scrolloff = 1
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.opt.cmdheight = 1
vim.opt.textwidth = 109
vim.opt.colorcolumn = "110"

local diagnostic_signs = {
	[vim.diagnostic.severity.ERROR] = "〄",
	[vim.diagnostic.severity.INFO] = "〄",
	[vim.diagnostic.severity.WARN] = "〄",
	[vim.diagnostic.severity.HINT] = "〄",
}
vim.diagnostic.config({
	virtual_text = {
		virt_text_win_col = 107,
		prefix = "",
	},
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = "rounded",
		scope = "cursor",
	},
	signs = {
		text = diagnostic_signs,
	},
})
