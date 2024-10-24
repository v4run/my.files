vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { tab = " ", space = "·", eol = "󰌑", trail = "␠" } -- indent guide lines
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
