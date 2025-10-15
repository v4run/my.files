return {
	"williamboman/mason-lspconfig.nvim",
	version = "^1.0.0",
	dependencies = {
		{ "williamboman/mason.nvim", version = "^1.0.0" },
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
				vim.diagnostic.jump({ count = -1, float = false })
			end, opts)
			vim.keymap.set("n", "gl", function()
				vim.diagnostic.jump({ count = 1, float = false })
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
		local merge_config = function(_config)
			return vim.tbl_deep_extend("force", {
				on_attach = on_attach,
				capabilities = lsp_capabilities,
				flags = {
					debounce_text_changes = 150,
				},
			}, _config or {})
		end
		local function setup_lsp(server_name, lsp_config)
			vim.lsp.config(server_name, merge_config(lsp_config))
			vim.lsp.enable(server_name)
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
			automatic_installation = true,
			handlers = {
				function(server_name)
					setup_lsp(server_name, {})
				end,
				["jdtls"] = function(server_name)
					setup_lsp(server_name, {
						cmd = {
							"jdtls",
							"--jvm-arg=" .. string.format(
								"-javaagent:%s",
								require("mason-registry").get_package("jdtls"):get_install_path() .. "/lombok.jar"
							),
						},
						root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
					})
				end,
				["clangd"] = function(server_name)
					setup_lsp(server_name, {
						cmd = {
							"clangd",
							"--background-index",
							"--clang-tidy",
							"--completion-style=detailed",
							"--header-insertion-decorators",
							"--log=error",
						},
					})
				end,
				["gopls"] = function(server_name)
					setup_lsp(server_name, {
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
					})
				end,
				["rust_analyzer"] = function(server_name)
					setup_lsp(server_name, {
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
					})
				end,
				["lua_ls"] = function(server_name)
					setup_lsp(server_name, {
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
					})
				end,
			},
		}
		return opts
	end,
}
