local highlight_disabled_langs = { ["vim"] = true }

require("nvim-treesitter.configs").setup({
	-- ensure_installed = "all", -- "all", "maintained" or list of languages
	ensure_installed = {"bash", "c", "cmake", "commonlisp", "cpp", "css", "dockerfile", "go", "gomod", "gowork", "graphql", "haskell", "html", "java", "javascript", "jsdoc", "json", "json5", "jsonc", "latex", "llvm", "lua", "make", "markdown", "markdown_inline", "ninja", "perl", "proto", "python", "query", "regex", "ruby", "rust", "scala", "scheme", "scss", "sql", "svelte", "toml", "tsx", "typescript", "vim", "vue", "yaml"}, -- "all", "maintained" or list of languages
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = function(lang, bufnr)
			return highlight_disabled_langs[lang] or vim.api.nvim_buf_line_count(bufnr) > 100000
		end,
		additional_vim_regex_highlighting = false,
	},
	refactor = {
		highlight_definitions = { enable = false },
		highlight_current_scope = { enable = false },
		highlight_references = { enable = false },
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
