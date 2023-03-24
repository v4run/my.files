local keymap = require("varun.keymap")
local nnoremap = keymap.nnoremap
local inoremap = keymap.inoremap

local on_attach = function(--[[ client, bufnr ]])
	nnoremap("gi", function()
		vim.lsp.buf.implementation()
	end)
	nnoremap("gc", function()
		vim.lsp.buf.incoming_calls()
	end)
	-- nnoremap("gr", "<cmd>Lspsaga lsp_finder<CR>")
	nnoremap("gr", function()
		vim.lsp.buf.references()
	end)
	-- nnoremap("gr", "<cmd>Telescope lsp_references<CR>")
	-- nnoremap("gs", "<cmd>Telescope lsp_document_symbols<CR>")
	nnoremap("gs", function()
		require("telescope.builtin").lsp_document_symbols(
			require("telescope.themes").get_ivy({ layout_strategy = "vertical" })
		)
	end)
	nnoremap("gd", function()
		vim.lsp.buf.definition()
	end)
	nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
	nnoremap("<Leader>r", "<cmd>Lspsaga rename<CR>")
	nnoremap("<Leader>p", function()
		vim.lsp.buf.declaration()
	end)
	inoremap("<C-h>", function()
		vim.lsp.buf.signature_help()
	end)
	nnoremap("<Leader>D", function()
		vim.lsp.buf.type_definition()
	end)
	nnoremap("<Leader>a", "<cmd>Lspsaga code_action<CR>")
	nnoremap("<Leader>e", function()
		vim.diagnostic.open_float()
	end)
	nnoremap("<Leader>wa", function()
		vim.lsp.buf.add_workspace_folder()
	end)
	nnoremap("<Leader>wr", function()
		vim.lsp.buf.remove_workspace_folder()
	end)
	nnoremap("<Leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)
	nnoremap("<Leader>j", function()
		vim.diagnostic.goto_prev()
	end)
	nnoremap("<Leader>k", function()
		vim.diagnostic.goto_next()
	end)
end

local nvim_lsp = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Merge configs
local config = function(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	}, _config or {})
end

nvim_lsp.gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			codelenses = {
				generate = true,
			},
			usePlaceholders = true,
			analyses = {
				fieldalignment = true,
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
				unusedvariable = true,
			},
			staticcheck = true,
		},
	},
}))

nvim_lsp.pyright.setup(config())
nvim_lsp.bashls.setup(config())
nvim_lsp.clangd.setup(config())
nvim_lsp.tsserver.setup(config())
nvim_lsp.lua_ls.setup(config({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}))
nvim_lsp.yamlls.setup(config())
nvim_lsp.hls.setup(config())
nvim_lsp.tailwindcss.setup(config())
