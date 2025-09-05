return {
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"astro",
				"bash",
				"c",
				"cmake",
				"cpp",
				"css",
				"dockerfile",
				"fish",
				"gitignore",
				"go",
				"graphql",
				"html",
				"http",
				"java",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"php",
				"python",
				"regex",
				"rust",
				"scss",
				"sql",
				"svelte",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			-- Enable syntax highlighting
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			-- Enable incremental selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<C-s>",
					node_decremental = "<M-space>",
				},
			},
			-- Enable text objects
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
					},
				},
			},
			-- Enable indentation
			indent = {
				enable = true,
			},
			-- Enable auto-install for missing parsers
			auto_install = true,
			-- https://github.com/nvim-treesitter/playground#query-linter
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = true, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			
			-- File type associations
			vim.filetype.add({
				extension = {
					mdx = "mdx",
					env = "sh",
				},
				filename = {
					[".env"] = "sh",
					[".env.local"] = "sh",
					[".env.development"] = "sh",
					[".env.production"] = "sh",
					[".env.staging"] = "sh",
					[".env.test"] = "sh",
					[".env.example"] = "sh",
					["Dockerfile"] = "dockerfile",
					["docker-compose.yml"] = "yaml",
					["docker-compose.yaml"] = "yaml",
				},
				pattern = {
					["%.env%..*"] = "sh",
					[".*%.env%..*"] = "sh",
					["Dockerfile%..*"] = "dockerfile",
				},
			})
			
			-- Language registrations
			vim.treesitter.language.register("markdown", "mdx")
			vim.treesitter.language.register("bash", "sh")
		end,
	},
	-- Optional: Add treesitter text objects plugin
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
}
