local highlight_disabled_langs = { ["vim"] = true }

local function disable_treesitter(lang, bufnr)
	return highlight_disabled_langs[lang] or vim.api.nvim_buf_line_count(bufnr) > 10000
end

local function merge(config)
	return vim.tbl_deep_extend("force", {
		disable = disable_treesitter,
	}, config or {})
end

local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	init = function(plugin)
		-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
		-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
		-- no longer trigger the **nvim-treesitter** module to be loaded in time.
		-- Luckily, the only things that those plugins need are the custom queries, which we make available
		-- during startup.
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	opts = {
		modules = {},
		ignore_install = {},
		-- A list of parser names, or "all" (the listed parsers MUST always be installed)
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"go",
			"java",
			"javascript",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"rust",
			"typescript",
			"vim",
			"vimdoc",
			"zig",
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		highlight = merge({
			enable = true,
			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		}),
		textobjects = {
			select = merge({
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ic"] = "@class.inner",
					["ac"] = "@class.outer",
					["as"] = "@scope",
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
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}

return { M }
