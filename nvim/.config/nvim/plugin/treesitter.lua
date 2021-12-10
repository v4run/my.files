require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained", -- "all", "maintained" or list of languages
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = { "vim" },
		additional_vim_regex_highlighting = false,
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
})
