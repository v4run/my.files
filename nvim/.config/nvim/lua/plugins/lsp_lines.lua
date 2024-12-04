return {
	"v4run/lsp_lines.nvim",
	config = {},
	init = function()
		local diagnostic_info = {
			[vim.diagnostic.severity.ERROR] = {
				icon = "󰀩",
				icon_hl = "DiagnosticVirtualTextIconError",
				hl = "DiagnosticVirtualTextError",
			},
			[vim.diagnostic.severity.WARN] = {
				icon = "󰀦",
				icon_hl = "DiagnosticVirtualTextIconWarn",
				hl = "DiagnosticVirtualTextWarn",
			},
			[vim.diagnostic.severity.INFO] = {
				icon = "󰀨",
				icon_hl = "DiagnosticVirtualTextIconInfo",
				hl = "DiagnosticVirtualTextInfo",
			},
			[vim.diagnostic.severity.HINT] = {
				icon = "󰭺",
				icon_hl = "DiagnosticVirtualTextIconHint",
				hl = "DiagnosticVirtualTextHint",
			},
		}
		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = {
				prefix = function(diagnostic)
					local di = diagnostic_info[diagnostic.severity]
					return { { "▏" .. di.icon .. " ", di.icon_hl }, { " ", di.hl } }
				end,
				only_current_line = {
					virtual_text = {
						prefix = function(diagnostic)
							local di = diagnostic_info[diagnostic.severity]
							return { "▏" .. di.icon .. " ", di.icon_hl }
						end,
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
				text = {
					[vim.diagnostic.severity.ERROR] = diagnostic_info[vim.diagnostic.severity.ERROR].icon,
					[vim.diagnostic.severity.WARN] = diagnostic_info[vim.diagnostic.severity.WARN].icon,
					[vim.diagnostic.severity.INFO] = diagnostic_info[vim.diagnostic.severity.INFO].icon,
					[vim.diagnostic.severity.HINT] = diagnostic_info[vim.diagnostic.severity.HINT].icon,
				},
			},
		})
		vim.diagnostic.config({
			virtual_text = {
				virt_text_pos = "right_align",
				suffix = string.rep(" ", 4),
				prefix = "▨",
			},
			virtual_lines = false,
		}, vim.api.nvim_create_namespace("lazy"))
	end,
}
