local keymap = require("varun.keymap")
local nnoremap = keymap.nnoremap
local inoremap = keymap.inoremap

local on_attach = function(--[[client, bufnr--]])
	nnoremap("gi", function()
		vim.lsp.buf.implementation()
	end)
	nnoremap("gc", function()
		vim.lsp.buf.incoming_calls()
	end)
	nnoremap("gr", function()
		vim.lsp.buf.references()
	end)
	nnoremap("gd", function()
		vim.lsp.buf.definition()
	end)
	nnoremap("K", function()
		vim.lsp.buf.hover()
	end)
	nnoremap("<Leader>r", function()
		vim.lsp.buf.rename()
	end)
	nnoremap("<Leader>p", function()
		vim.lsp.buf.declaration()
	end)
	inoremap("<C-j>", function()
		vim.lsp.buf.signature_help()
	end)
	nnoremap("<Leader>D", function()
		vim.lsp.buf.type_definition()
	end)
	nnoremap("<Leader>a", function()
		vim.lsp.buf.code_action()
	end)
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
	nnoremap("[d", function()
		vim.diagnostic.goto_prev()
	end)
end

local nvim_lsp = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

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
			usePlaceholders = true,
			analyses = {
				fieldalignment = true,
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusedwrite = true,
			},
			staticcheck = true,
		},
	},
}))

nvim_lsp.pyright.setup(config())
nvim_lsp.bashls.setup(config())
nvim_lsp.clangd.setup(config())
nvim_lsp.tsserver.setup(config())
nvim_lsp.sumneko_lua.setup(config({
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
