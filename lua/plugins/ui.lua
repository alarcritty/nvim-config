return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})

			opts.presets.lsp_doc_border = true
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
			background_colour = "#000000",
			stages = "fade_in_slide_out",
			render = "wrapped-compact",
			max_width = 50,
		},
	},

	{
		"snacks.nvim",
		opts = {
			scroll = { enabled = false },
		},
		keys = {},
	},

	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				show_buffer_close_icons = false,
				show_close_icon = false,
				indicator = { style = "underline" },
				modified_icon = "●",
			},
			highlights = {
				fill = { bg = "#000000" },
				background = { fg = "#565f89", bg = "#000000" },
				tab = { fg = "#565f89", bg = "#000000" },
				tab_selected = { fg = "#7dcfff", bg = "#080810", bold = true },
				tab_separator = { fg = "#0c0c14", bg = "#000000" },
				tab_separator_selected = { fg = "#7dcfff", bg = "#080810" },
				buffer_selected = { fg = "#7dcfff", bg = "#080810", bold = true, italic = false },
				indicator_selected = { fg = "#7dcfff", bg = "#080810" },
				modified_selected = { fg = "#bb9af7", bg = "#080810" },
			},
		},
	},

	-- filename
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		config = function()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = "#7dcfff", guifg = "#000000" },
						InclineNormalNC = { guifg = "#565f89", guibg = "#080810" },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.options = {
				theme = {
					normal = {
						a = { fg = "#000000", bg = "#7dcfff", gui = "bold" },
						b = { fg = "#7dcfff", bg = "#080810" },
						c = { fg = "#565f89", bg = "#000000" },
					},
					insert = {
						a = { fg = "#000000", bg = "#9ece6a", gui = "bold" },
						b = { fg = "#9ece6a", bg = "#080810" },
					},
					visual = {
						a = { fg = "#000000", bg = "#bb9af7", gui = "bold" },
						b = { fg = "#bb9af7", bg = "#080810" },
					},
					replace = {
						a = { fg = "#000000", bg = "#f7768e", gui = "bold" },
					},
					command = {
						a = { fg = "#000000", bg = "#e0af68", gui = "bold" },
					},
					inactive = {
						a = { fg = "#565f89", bg = "#000000" },
						b = { fg = "#565f89", bg = "#000000" },
						c = { fg = "#565f89", bg = "#000000" },
					},
				},
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			}

			opts.sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					"diagnostics",
					{
						"filetype",
						icon_only = true,
						padding = { left = 1, right = 0 },
					},
					{
						require("lazyvim.util").lualine.pretty_path({
							length = 0,
							relative = "cwd",
							modified_hl = "MatchParen",
							directory_hl = "",
							filename_hl = "Bold",
							modified_sign = " ●",
							readonly_icon = " 󰌾 ",
						}),
					},
				},
				lualine_x = {
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if #clients == 0 then
								return ""
							end
							local names = {}
							for _, client in ipairs(clients) do
								table.insert(names, client.name)
							end
							return " " .. table.concat(names, ", ")
						end,
						color = { fg = "#565f89" },
					},
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			}

			opts.inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			}

			opts.extensions = { "lazy", "mason", "trouble" }
		end,
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
	},
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					header = [[

       █████╗ ██╗      █████╗ ██████╗  ██████╗██████╗ ██╗████████╗████████╗██╗   ██╗
      ██╔══██╗██║     ██╔══██╗██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝
      ███████║██║     ███████║██████╔╝██║     ██████╔╝██║   ██║      ██║    ╚████╔╝
      ██╔══██║██║     ██╔══██║██╔══██╗██║     ██╔══██║██║   ██║      ██║     ╚██╔╝
      ██║  ██║███████╗██║  ██║██║  ██║╚██████╗██║  ██║██║   ██║      ██║      ██║
      ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝      ╚═╝

          ]],
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
		},
	},

	-- Force neon colors - override any LazyVim defaults
	{
		"LazyVim/LazyVim",
		opts = function(_, opts)
			-- Ensure our colorscheme is used
			opts.colorscheme = "tokyonight-night"
		end,
	},
}
