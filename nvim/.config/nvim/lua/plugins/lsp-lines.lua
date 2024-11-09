return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	opts = {},
	init = function()
		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
}
