return {
	"v4run/lsp_lines",
	config = {},
	init = function()
		local diagnostic_signs = {
			[vim.diagnostic.severity.ERROR] = "〄",
			[vim.diagnostic.severity.INFO] = "〄",
			[vim.diagnostic.severity.WARN] = "〄",
			[vim.diagnostic.severity.HINT] = "〄",
		}
		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = {
				only_current_line = {
					virtual_text = {
						prefix = "▨",
					},
				},
			},
			update_in_insert = true,
			severity_sort = true,
			float = {
				border = "rounded",
				scope = "cursor",
			},
			signs = {
				text = diagnostic_signs,
			},
		})
	end,
}
