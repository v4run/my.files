-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("L3MON4D3/LuaSnip")
	use("ThePrimeagen/harpoon")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("neovim/nvim-lspconfig")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope-fzf-native.nvim", { run = "make" })
	use("nvim-telescope/telescope.nvim")
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/playground")
	use("onsails/lspkind-nvim")
	use("saadparwaiz1/cmp_luasnip")
	use("sainnhe/gruvbox-material")
	use("sbdchd/neoformat")
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

	-- Debugger
	use("mfussenegger/nvim-dap")
	use({ "leoluz/nvim-dap-go", requires = { "mfussenegger/nvim-dap" } })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("nvim-telescope/telescope-dap.nvim")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- commenting
	use("numToStr/Comment.nvim")

	-- surround
	use({ "kylechui/nvim-surround", tag = "*" })
end)
