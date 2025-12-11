
return {
	-- mason tools
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"selene",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
				"css-lsp",
				"pyright",
				"black",
				"isort",
				"flake8",
				"clangd",
				"clang-format",

				-- 🚀 Dart & Flutter
				"dart-debug-adapter",
			})
		end,
	},

	-- flutter-tools.nvim (best Flutter experience in nvim)
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- Optional UI improvements
		},
		config = function()
			require("flutter-tools").setup({
				flutter_path = "flutter",
				dart_path = "dart",
				ui = {
					border = "rounded",
					notification_style = "native",
				},
				debugger = {
					enabled = true,
					run_via_dap = true,
				},
				decorations = {
					statusline = {
						app_version = true,
						device = true,
					},
				},
				widget_guides = {
					enabled = true,
				},
				lsp = {
					color = { enabled = true },
					settings = {
						dart = {
							completeFunctionCalls = true,
							showTodos = true,
						},
					},
				},
			})
		end,
	},

	-- All LSPs
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			servers = {
				-- Existing LSP configs
				cssls = {},
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},
				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},

				-- Python
				pyright = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(
							".git",
							"pyproject.toml",
							"setup.py",
							"setup.cfg",
							"requirements.txt",
							"Pipfile"
						)(...)
					end,
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "workspace",
								useLibraryCodeForTypes = true,
								typeCheckingMode = "basic",
							},
						},
					},
				},

				-- C/C++
				clangd = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(
							".clangd",
							".clang-tidy",
							".clang-format",
							"compile_commands.json",
							"compile_flags.txt",
							"configure.ac",
							".git"
						)(...)
					end,
					capabilities = {
						offsetEncoding = { "utf-16" },
					},
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"--fallback-style=llvm",
					},
					init_options = {
						usePlaceholders = true,
					},
				},

				html = {},

				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},

				lua_ls = {
					single_file_support = true,
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							completion = { workspaceWord = true, callSnippet = "Both" },
							hint = {
								enable = true,
								paramType = true,
								paramName = "Disable",
								arrayIndex = "Disable",
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},

				-- 🚀 NEW: Dart Language Server
				dartls = {
					on_attach = function(client, bufnr)
						-- Enable formatting
						client.server_capabilities.documentFormattingProvider = true
					end,
					settings = {
						dart = {
							analysisExcludedFolders = {},
							suggestFromUnimportedLibraries = true,
							showTodos = true,
						},
					},
				},
			},
			setup = {},
		},
	},

	-- override keymaps
	{
		"neovim/nvim-lspconfig",
		opts = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			vim.list_extend(keys, {
				{
					"gd",
					function()
						require("telescope.builtin").lsp_definitions({ reuse_win = false })
					end,
					desc = "Goto Definition",
					has = "definition",
				},
			})
		end,
	},
}
