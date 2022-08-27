require("varun.packer")
require("varun.set")
require("varun.remap")

local api = vim.api

local fmt = api.nvim_create_augroup("fmt", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
	command = "Neoformat",
	group = fmt,
})
