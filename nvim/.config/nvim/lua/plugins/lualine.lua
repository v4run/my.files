return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	opts = function()
		-- PERF: we don't need this lualine require madness
		local lualine_require = require("lualine_require")
		lualine_require.require = require

		-- local icons = LazyVim.config.icons
		vim.o.laststatus = vim.g.lualine_laststatus
		local filename = { "filename", path = 3 }
		local opts = {
			options = {
				icons_enabled = true,
				theme = {
					normal = {
						c = { bg = "#040001", fg = "#938f8e" },
						b = { bg = "#040001", fg = "#938f8e" },
						a = { bg = "#040001", fg = "#938f8e" },
					},
				},
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { filename },
				lualine_x = { "diff", "diagnostics" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { filename },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				lualine_a = {},
				lualine_b = {
					{
						"buffers",
						mode = 4,
						icons_enabled = false,
						buffers_color = {
							inactive = { fg = "#29242a" },
						},
					},
				},
				lualine_x = { { "branch", icon = "" } },
				lualine_y = { { "filetype", icon = { align = "right" } } },
				lualine_z = {},
			},
			extensions = { "nvim-tree", "lazy" },
		}
		return opts
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
