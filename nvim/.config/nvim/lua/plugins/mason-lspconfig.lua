return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
	},
	opts = function()
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
				vim.diagnostic.goto_prev({ float = false })
			end, opts)
			vim.keymap.set("n", "gl", function()
				vim.diagnostic.goto_next({ float = false })
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
		local lsp_capabilities =
			require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		local config = function(_config)
			return vim.tbl_deep_extend("force", {
				on_attach = on_attach,
				handlers = {
					["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				},
				capabilities = lsp_capabilities,
				flags = {
					debounce_text_changes = 150,
				},
			}, _config or {})
		end
		local opts = {
			ensure_installed = {
				"bashls",
				"clangd",
				"cmake",
				"gopls",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"tailwindcss",
				"ts_ls",
				"yamlls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup(config())
				end,
				["clangd"] = function()
					require("lspconfig").clangd.setup(config({
						cmd = {
							"clangd",
							"--background-index",
							"--clang-tidy",
							"--completion-style=detailed",
							"--header-insertion-decorators",
							"--log=error",
						},
					}))
				end,
				["gopls"] = function()
					require("lspconfig").gopls.setup(config({
						cmd = { "gopls", "serve" },
						settings = {
							gopls = {
								codelenses = {
									generate = true,
									gc_details = true,
								},
								usePlaceholders = true,
								analyses = {
									shadow = true,
									unusedvariable = true,
									useany = true,
								},
								staticcheck = true,
								vulncheck = "Imports", -- "Imports" or "Off"
							},
						},
					}))
				end,
				["rust_analyzer"] = function()
					require("lspconfig").rust_analyzer.setup(config({
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
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup(config({
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
				end,
			},
		}
		return opts
	end,
}
