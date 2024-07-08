local highlight_disabled_langs = { ["vim"] = true }

local function disable_treesitter(lang, bufnr)
	return highlight_disabled_langs[lang] or vim.api.nvim_buf_line_count(bufnr) > 100000
end

local function merge(config)
	return vim.tbl_deep_extend("force", {
		disable = disable_treesitter,
	}, config or {})
end

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"commonlisp",
		"comment",
		"cpp",
		"css",
		"dockerfile",
		"go",
		"gomod",
		"gowork",
		"graphql",
		"haskell",
		"html",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"jsonc",
		"latex",
		"llvm",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"ninja",
		"perl",
		"proto",
		"python",
		"query",
		"regex",
		"ruby",
		"rust",
		"scheme",
		"scss",
		"sql",
		"svelte",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vue",
		"yaml",
		"zig",
	}, -- "all", "maintained" or list of languages
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	highlight = merge({
		enable = true,
		disable = disable_treesitter,
		additional_vim_regex_highlighting = false,
	}),
	textobjects = {
		select = merge({
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			},
		}),
	},
	incremental_selection = merge({
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	}),
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
	indent = {
		enable = true,
	},
})
