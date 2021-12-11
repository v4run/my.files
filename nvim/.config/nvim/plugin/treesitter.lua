require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained", -- "all", "maintained" or list of languages
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = { "vim" },
		additional_vim_regex_highlighting = false,
	},
	refactor = {
		highlight_definitions = { enable = false },
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			},
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "<C-l>",
			node_decremental = "<C-h>",
		},
	},
})
