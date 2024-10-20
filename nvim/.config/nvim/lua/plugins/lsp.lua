return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	config = function()
		local on_attach = function(--[[ client --]]_, bufnr)
			local opts = { buffer = bufnr }
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			vim.keymap.set("n", "ga", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "gs", function()
				vim.lsp.buf.document_symbol()
			end, opts)
			vim.keymap.set("n", "gh", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "gl", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "gi", function()
				vim.lsp.buf.implementation()
			end, opts)
			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "gt", function()
				vim.lsp.buf.type_definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>r", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end

		local lspconfig = require("lspconfig")
		local lsp_capabilities =
			require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		local config = function(_config)
			return vim.tbl_deep_extend("force", {
				on_attach = on_attach,
				capabilities = lsp_capabilities,
				flags = {
					debounce_text_changes = 150,
				},
				-- on_new_config = on_new_config,
			}, _config or {})
		end
		lspconfig.lua_ls.setup(config({
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
		lspconfig.gopls.setup(config({
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

		lspconfig.pyright.setup(config())
		-- nvim_lsp.ruff_lsp.setup(config())
		lspconfig.bashls.setup(config())
		lspconfig.clangd.setup(config())
		lspconfig.ts_ls.setup(config())
		lspconfig.lua_ls.setup(config({
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
		lspconfig.yamlls.setup(config())
		lspconfig.hls.setup(config())
		lspconfig.tailwindcss.setup(config())
		lspconfig.cmake.setup(config())
		lspconfig.rust_analyzer.setup(config({}))
		lspconfig.zls.setup(config({
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
	end,
}
