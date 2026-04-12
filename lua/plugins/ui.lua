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

	-- buffer line (disabled for minimal layout)
	{
		"akinsho/bufferline.nvim",
		enabled = false,
	},

	-- filename (disabled for minimal layout)
	{
		"b0o/incline.nvim",
		enabled = false,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "",
				section_separators = "",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			}

			opts.sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = { modified = " ●", readonly = " 󰌾" },
					},
				},
				lualine_x = { "diagnostics", "branch" },
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

			opts.extensions = { "lazy" }
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
			dashboard = { enabled = false },
		},
	},

}
