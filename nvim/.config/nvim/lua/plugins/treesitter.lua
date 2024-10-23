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
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	opts = {
		modules = {},
		ignore_install = {},
		-- A list of parser names, or "all" (the listed parsers MUST always be installed)
		ensure_installed = {
			"java",
			"c",
			"lua",
			"vim",
			"javascript",
			"python",
			"typescript",
			"cpp",
			"go",
			"rust",
			"zig",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"bash",
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
}

return { M }
