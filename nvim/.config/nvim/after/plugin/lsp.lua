local keymap = require("varun.keymap")
local nnoremap = keymap.nnoremap
local v = vim

local on_attach = function(--[[client, bufnr--]])
	local opts = { silent = true }
	nnoremap("gi", function()
		v.lsp.buf.implementation()
	end, opts)
	nnoremap("gc", function()
		v.lsp.buf.incoming_calls()
	end, opts)
	nnoremap("gr", function()
		v.lsp.buf.references()
	end, opts)
	nnoremap("gd", function()
		v.lsp.buf.definition()
	end, opts)
	nnoremap("K", function()
		v.lsp.buf.hover()
	end, opts)
	nnoremap("<Leader>r", function()
		v.lsp.buf.rename()
	end, opts)
	nnoremap("<Leader>p", function()
		v.lsp.buf.declaration()
	end, opts)
	nnoremap("<C-j>", function()
		v.lsp.buf.signature_help()
	end, opts)
	nnoremap("<Leader>D", function()
		v.lsp.buf.type_definition()
	end, opts)
	nnoremap("<Leader>ca", function()
		v.lsp.buf.code_action()
	end, opts)
	nnoremap("<Leader>e", function()
		v.diagnostic.open_float()
	end, opts)
	nnoremap("<Leader>wa", function()
		v.lsp.buf.add_workspace_folder()
	end, opts)
	nnoremap("<Leader>wr", function()
		v.lsp.buf.remove_workspace_folder()
	end, opts)
	nnoremap("<Leader>wl", function()
		print(v.inspect(v.lsp.buf.list_workspace_folders()))
	end, opts)
	nnoremap("[d", function()
		v.diagnostic.goto_prev()
	end, opts)
end

local nvim_lsp = require("lspconfig")
local capabilities = v.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Merge configs
local config = function(_config)
	return v.tbl_deep_extend("force", {
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
