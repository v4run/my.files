require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {
			config = {
				icon_preset = "varied",
			},
		},
		["core.dirman"] = {},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
	},
})
