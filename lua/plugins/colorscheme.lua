return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "transparent",
				floats = "transparent",
			},
			on_colors = function(colors)
				-- Deep black base
				colors.bg = "#000000"
				colors.bg_dark = "#000000"
				colors.bg_float = "#080810"
				colors.bg_popup = "#080810"
				colors.bg_sidebar = "#000000"
				colors.bg_statusline = "#080810"
				colors.bg_highlight = "#0c0c14"

				-- Smooth foreground
				colors.fg = "#c0caf5"
				colors.fg_dark = "#a9b1d6"
				colors.fg_gutter = "#3b4261"

				-- Refined accent colors
				colors.cyan = "#7dcfff"
				colors.blue = "#7aa2f7"
				colors.purple = "#bb9af7"
				colors.magenta = "#ff007c"
				colors.green = "#9ece6a"
				colors.orange = "#ff9e64"
				colors.yellow = "#e0af68"
				colors.red = "#f7768e"

				-- UI elements
				colors.border = "#27a1b9"
				colors.comment = "#565f89"
			end,
			on_highlights = function(hl, c)
				-- Cursor and lines
				hl.CursorLine = { bg = "#0c0c14" }
				hl.CursorLineNr = { fg = "#7dcfff", bold = true }
				hl.LineNr = { fg = "#3b4261" }
				hl.LineNrAbove = { fg = "#3b4261" }
				hl.LineNrBelow = { fg = "#3b4261" }

				-- Visual and search
				hl.Visual = { bg = "#1c1c2e" }
				hl.VisualNOS = { bg = "#1c1c2e" }
				hl.Search = { fg = "#000000", bg = "#7dcfff" }
				hl.IncSearch = { fg = "#000000", bg = "#ff007c" }
				hl.CurSearch = { fg = "#000000", bg = "#ff9e64" }

				-- Syntax - smooth and balanced
				hl.Comment = { fg = "#565f89", italic = true }
				hl.Constant = { fg = "#ff9e64" }
				hl.String = { fg = "#9ece6a" }
				hl.Character = { fg = "#9ece6a" }
				hl.Number = { fg = "#ff9e64" }
				hl.Boolean = { fg = "#ff9e64" }
				hl.Float = { fg = "#ff9e64" }
				hl.Identifier = { fg = "#c0caf5" }
				hl.Function = { fg = "#7aa2f7" }
				hl.Statement = { fg = "#bb9af7" }
				hl.Keyword = { fg = "#bb9af7", italic = true }
				hl.Operator = { fg = "#89ddff" }
				hl.Type = { fg = "#7dcfff" }
				hl.Special = { fg = "#7dcfff" }

				-- Matching
				hl.MatchParen = { fg = "#ffffff", bg = "#3b4261", bold = true }

				-- Diagnostics
				hl.DiagnosticError = { fg = "#f7768e" }
				hl.DiagnosticWarn = { fg = "#e0af68" }
				hl.DiagnosticInfo = { fg = "#7dcfff" }
				hl.DiagnosticHint = { fg = "#9ece6a" }
				hl.DiagnosticUnderlineError = { undercurl = true, sp = "#f7768e" }
				hl.DiagnosticUnderlineWarn = { undercurl = true, sp = "#e0af68" }
				hl.DiagnosticUnderlineInfo = { undercurl = true, sp = "#7dcfff" }
				hl.DiagnosticUnderlineHint = { undercurl = true, sp = "#9ece6a" }

				-- Git signs
				hl.GitSignsAdd = { fg = "#9ece6a" }
				hl.GitSignsChange = { fg = "#7dcfff" }
				hl.GitSignsDelete = { fg = "#f7768e" }

				-- Telescope
				hl.TelescopeBorder = { fg = "#27a1b9" }
				hl.TelescopePromptBorder = { fg = "#7dcfff" }
				hl.TelescopeResultsBorder = { fg = "#27a1b9" }
				hl.TelescopePreviewBorder = { fg = "#27a1b9" }
				hl.TelescopeSelection = { bg = "#0c0c14", fg = "#7dcfff" }
				hl.TelescopeSelectionCaret = { fg = "#ff007c" }
				hl.TelescopePromptPrefix = { fg = "#7dcfff" }
				hl.TelescopePromptTitle = { fg = "#000000", bg = "#7dcfff", bold = true }
				hl.TelescopeResultsTitle = { fg = "#27a1b9" }
				hl.TelescopePreviewTitle = { fg = "#000000", bg = "#9ece6a", bold = true }

				-- Floating windows
				hl.FloatBorder = { fg = "#27a1b9" }
				hl.NormalFloat = { bg = "#080810" }
				hl.FloatTitle = { fg = "#7dcfff", bold = true }

				-- Pmenu (completion)
				hl.Pmenu = { bg = "#080810", fg = "#c0caf5" }
				hl.PmenuSel = { bg = "#1c1c2e", fg = "#7dcfff" }
				hl.PmenuSbar = { bg = "#0c0c14" }
				hl.PmenuThumb = { bg = "#27a1b9" }

				-- Dashboard
				hl.SnacksDashboardHeader = { fg = "#5eead4" }
				hl.SnacksDashboardFooter = { fg = "#565f89" }
				hl.SnacksDashboardIcon = { fg = "#7aa2f7" }
				hl.SnacksDashboardKey = { fg = "#ff007c", bold = true }
				hl.SnacksDashboardDesc = { fg = "#a9b1d6" }

				-- Which-key
				hl.WhichKey = { fg = "#7dcfff" }
				hl.WhichKeyGroup = { fg = "#bb9af7" }
				hl.WhichKeyDesc = { fg = "#a9b1d6" }
				hl.WhichKeySeparator = { fg = "#3b4261" }
				hl.WhichKeyFloat = { bg = "#080810" }
				hl.WhichKeyBorder = { fg = "#27a1b9" }

				-- Lazy
				hl.LazyH1 = { fg = "#000000", bg = "#7dcfff", bold = true }
				hl.LazyH2 = { fg = "#7dcfff", bold = true }
				hl.LazyButton = { fg = "#a9b1d6", bg = "#0c0c14" }
				hl.LazyButtonActive = { fg = "#000000", bg = "#7dcfff", bold = true }
				hl.LazySpecial = { fg = "#bb9af7" }
				hl.LazyProgressDone = { fg = "#9ece6a" }
				hl.LazyProgressTodo = { fg = "#3b4261" }

				-- Mason
				hl.MasonHeader = { fg = "#000000", bg = "#7dcfff", bold = true }
				hl.MasonHighlight = { fg = "#7dcfff" }
				hl.MasonHighlightSecondary = { fg = "#bb9af7" }
				hl.MasonMuted = { fg = "#565f89" }

				-- Indent
				hl.IblIndent = { fg = "#1a1a2a" }
				hl.IblScope = { fg = "#3b4261" }
				hl.IndentBlanklineChar = { fg = "#1a1a2a" }

				-- Treesitter context
				hl.TreesitterContext = { bg = "#0c0c14" }
				hl.TreesitterContextLineNumber = { fg = "#7dcfff" }

				-- Notify
				hl.NotifyBackground = { bg = "#080810" }
				hl.NotifyINFOBorder = { fg = "#7dcfff" }
				hl.NotifyINFOTitle = { fg = "#7dcfff" }
				hl.NotifyINFOIcon = { fg = "#7dcfff" }
				hl.NotifyWARNBorder = { fg = "#e0af68" }
				hl.NotifyWARNTitle = { fg = "#e0af68" }
				hl.NotifyWARNIcon = { fg = "#e0af68" }
				hl.NotifyERRORBorder = { fg = "#f7768e" }
				hl.NotifyERRORTitle = { fg = "#f7768e" }
				hl.NotifyERRORIcon = { fg = "#f7768e" }

				-- Noice
				hl.NoiceCmdlinePopupBorder = { fg = "#27a1b9" }
				hl.NoiceCmdlineIcon = { fg = "#7dcfff" }
				hl.NoiceConfirmBorder = { fg = "#27a1b9" }

				-- Cmp
				hl.CmpItemAbbrMatch = { fg = "#7dcfff", bold = true }
				hl.CmpItemAbbrMatchFuzzy = { fg = "#7dcfff", bold = true }
				hl.CmpItemKindFunction = { fg = "#7aa2f7" }
				hl.CmpItemKindMethod = { fg = "#7aa2f7" }
				hl.CmpItemKindVariable = { fg = "#c0caf5" }
				hl.CmpItemKindKeyword = { fg = "#bb9af7" }
				hl.CmpItemKindText = { fg = "#9ece6a" }
				hl.CmpItemKindProperty = { fg = "#7dcfff" }
				hl.CmpItemKindSnippet = { fg = "#e0af68" }

				-- Mini
				hl.MiniIndentscopeSymbol = { fg = "#3b4261" }

				-- Winbar / Incline
				hl.WinBar = { fg = "#a9b1d6", bg = "NONE" }
				hl.WinBarNC = { fg = "#565f89", bg = "NONE" }
			end,
		},
	},
}
