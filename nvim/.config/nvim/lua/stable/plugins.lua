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
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
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
			window = {
				position = "top",
				margin = { 0, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				winblend = 50,
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
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "loctvl842/monokai-pro.nvim" },
	{ "nvim-treesitter/playground" },
	{ "rose-pine/neovim", name = "rose-pine" },
}
local opts = {}
lazy.setup(plugins, opts)
