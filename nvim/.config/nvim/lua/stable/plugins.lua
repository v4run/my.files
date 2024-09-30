local lazy = require("lazy")
local plugins = {
	{ "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	"nvim-treesitter/nvim-treesitter",
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-dap.nvim", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{ "leoluz/nvim-dap-go", dependencies = { "mfussenegger/nvim-dap" } },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	"numToStr/Comment.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",
	"onsails/lspkind.nvim",
	"nvim-lualine/lualine.nvim",
	"lewis6991/gitsigns.nvim",
	"sbdchd/neoformat",
	"stevearc/dressing.nvim",
	"nvim-treesitter/nvim-treesitter-textobjects",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			win = {
				-- don't allow the popup to overlap with the cursor
				no_overlap = true,
				-- width = 1,
				-- height = { min = 4, max = 25 },
				-- col = 0,
				row = 0,
				-- border = "none",
				padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
				title = true,
				title_pos = "center",
				zindex = 1000,
				-- Additional vim.wo and vim.bo options
				bo = {},
				wo = {
					winblend = 50, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				},
			},
			layout = {
				height = { min = 20, max = 100 }, -- min and max height of the columns
				width = { min = 4, max = 50 }, -- min and max width of the columns
				align = "right",
			},
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "David-Kunz/gen.nvim" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"nvim-neorg/neorg",
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
local opts = {}
lazy.setup(plugins, opts)
