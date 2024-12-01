return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = { tab_char = { "▏" }, char = "▏" },
		scope = {
			show_start = false,
			enabled = true,
			show_end = false,
		},
	},
	config = true,
}
