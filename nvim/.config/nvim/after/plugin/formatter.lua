local fmt = vim.api.nvim_create_augroup("fmt", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	command = "Neoformat",
	group = fmt,
})
