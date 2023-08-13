local home = vim.fn.expand("$HOME")
vim.env.OPENAI_API_HOST = "api.openai.com"
require("chatgpt").setup({
	api_key_cmd = "gpg --decrypt " .. home .. "/.openai.txt.gpg",
})
