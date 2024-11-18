return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	opts = {},
	init = function()
		vim.diagnostic.config({
			virtual_text = false,
		})
		vim.diagnostic.config({
			virtual_text = true,
			virtual_lines = false,
		}, vim.api.nvim_create_namespace("lazy"))
	end,
}
