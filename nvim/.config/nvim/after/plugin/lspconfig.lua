local utils = require("stable.utils")
local nnoremap = utils.nnoremap
local inoremap = utils.inoremap

local on_attach = function(--[[ client --]]_, bufnr)
	vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	nnoremap("gi", function()
		vim.lsp.buf.implementation()
	end)
	nnoremap("gc", function()
		vim.lsp.buf.incoming_calls()
	end)
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
	nnoremap("K", function()
		vim.lsp.buf.hover()
	end)
	nnoremap("<Leader>r", function()
		vim.lsp.buf.rename()
	end)
	nnoremap("<Leader>p", function()
		vim.lsp.buf.declaration()
	end)
	inoremap("<C-h>", function()
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

local on_new_config = function(new_config, new_root_dir)
	local override_file_path = new_root_dir .. "/.lspconfig.lua"
	if utils.FileExists(override_file_path) then
		local _config = dofile(override_file_path)
		if _config.name ~= new_config.name then
			return
		end
		_config = vim.tbl_deep_extend("force", new_config, _config.config)
		new_config.settings = _config.settings
	end
end

-- Merge configs
local config = function(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
		on_new_config = on_new_config,
	}, _config or {})
end

nvim_lsp.gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			codelenses = {
				generate = true,
				gc_details = true,
			},
			usePlaceholders = true,
			analyses = {
				unreachable = true,
				fieldalignment = true,
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
				unusedvariable = true,
			},
			staticcheck = true,
			vulncheck = "Imports", -- "Imports" or "Off"
		},
	},
}))

nvim_lsp.pyright.setup(config())
-- nvim_lsp.ruff_lsp.setup(config())
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
				checkThirdParty = false,
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
nvim_lsp.cmake.setup(config())
nvim_lsp.rust_analyzer.setup(config({}))
nvim_lsp.zls.setup(config({
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
}))
