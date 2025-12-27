return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local languages = {
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
		}
		require("nvim-treesitter").install(languages)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = languages,
			callback = function()
				vim.treesitter.start()
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
