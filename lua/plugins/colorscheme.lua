return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",         -- Using mocha as base for dark colors
      transparent_background = true,
      no_italic = true,          -- Disable italics for cleaner look
      no_bold = true,            -- Disable bold for minimal appearance
      styles = {
        comments = { "italic" }, -- Keep comments slightly styled
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      custom_highlights = function(colors)
        -- Define a balanced color palette with green accents
        local theme_palette = {
          bg_dark = "#000000",   -- Pure black background
          bg_light = "#111111",  -- Dark popup background
          bg_popup = "#1a1a1a",  -- Slightly lighter popup
          bg_select = "#2a2a2a", -- Selection background

          -- Green accents (for UI elements and highlights)
          green_primary = "#9ece6a",   -- Main green (UI accents)
          green_secondary = "#7aa874", -- Secondary green
          green_accent = "#73daca",    -- Cyan-green accent
          green_bright = "#b9f27c",    -- Bright green highlights

          -- Text colors (more readable variety)
          fg_normal = "#ffffff",  -- Pure white for normal text
          fg_bright = "#f0f0f0",  -- Bright white
          fg_muted = "#888888",   -- Muted gray
          fg_comment = "#555555", -- Dark gray for comments

          -- Syntax colors (colorful but harmonious)
          syntax_string = "#a9dc76",   -- Light green for strings
          syntax_number = "#78dce8",   -- Cyan for numbers
          syntax_boolean = "#ff6188",  -- Pink for booleans
          syntax_function = "#ffd866", -- Yellow for functions
          syntax_keyword = "#ab9df2",  -- Purple for keywords
          syntax_type = "#78dce8",     -- Cyan for types
          syntax_constant = "#ff9867", -- Orange for constants

          border = "#333333",          -- Gray borders
          line = "#222222",            -- Line highlights
        }

        return {
          -- Base colors - Readable text with green accents
          Normal = { bg = theme_palette.bg_dark, fg = theme_palette.fg_normal },
          NormalFloat = { bg = theme_palette.bg_popup, fg = theme_palette.fg_normal },
          NormalNC = { bg = theme_palette.bg_dark, fg = theme_palette.fg_muted },

          -- Syntax highlighting - Colorful and readable
          Comment = { fg = theme_palette.fg_comment, style = { "italic" } },
          String = { fg = theme_palette.syntax_string },     -- Light green for strings
          Number = { fg = theme_palette.syntax_number },     -- Cyan for numbers
          Boolean = { fg = theme_palette.syntax_boolean },   -- Pink for booleans
          Function = { fg = theme_palette.syntax_function }, -- Yellow for functions
          Keyword = { fg = theme_palette.syntax_keyword },   -- Purple for keywords
          Type = { fg = theme_palette.syntax_type },         -- Cyan for types
          Identifier = { fg = theme_palette.fg_normal },     -- White for identifiers
          Constant = { fg = theme_palette.syntax_constant }, -- Orange for constants
          PreProc = { fg = theme_palette.syntax_keyword },   -- Purple for preprocessor
          Special = { fg = theme_palette.syntax_constant },  -- Orange for special
          Statement = { fg = theme_palette.syntax_keyword }, -- Purple for statements

          -- UI elements - Green accents with readable text
          LineNr = { fg = theme_palette.fg_muted },
          CursorLineNr = { fg = theme_palette.green_primary, bold = true },
          CursorLine = { bg = theme_palette.bg_light },
          Visual = { bg = theme_palette.bg_select },
          Search = { bg = theme_palette.line, fg = theme_palette.green_bright },
          IncSearch = { bg = theme_palette.green_bright, fg = theme_palette.bg_dark },

          -- Status line - Green accents
          StatusLine = { bg = theme_palette.bg_light, fg = theme_palette.green_primary },
          StatusLineNC = { bg = theme_palette.bg_dark, fg = theme_palette.fg_muted },

          -- Popups and menus - Readable with green accents
          Pmenu = { bg = theme_palette.bg_popup, fg = theme_palette.fg_normal },
          PmenuSel = { bg = theme_palette.bg_select, fg = theme_palette.green_bright },
          PmenuSbar = { bg = theme_palette.bg_light },
          PmenuThumb = { bg = theme_palette.fg_muted },

          -- Borders and separators - Subtle gray
          FloatBorder = { fg = theme_palette.border },
          WinSeparator = { fg = theme_palette.border },
          VertSplit = { fg = theme_palette.border },

          -- Notifications - Green themed but readable
          NotifyBackground = { bg = theme_palette.bg_popup },
          NotifyERRORBorder = { fg = theme_palette.syntax_boolean },
          NotifyWARNBorder = { fg = theme_palette.syntax_constant },
          NotifyINFOBorder = { fg = theme_palette.green_primary },
          NotifyDEBUGBorder = { fg = theme_palette.fg_muted },
          NotifyTRACEBorder = { fg = theme_palette.green_secondary },
          NotifyERRORIcon = { fg = theme_palette.syntax_boolean },
          NotifyWARNIcon = { fg = theme_palette.syntax_constant },
          NotifyINFOIcon = { fg = theme_palette.green_primary },
          NotifyDEBUGIcon = { fg = theme_palette.fg_muted },
          NotifyTRACEIcon = { fg = theme_palette.green_secondary },
          NotifyERRORTitle = { fg = theme_palette.syntax_boolean },
          NotifyWARNTitle = { fg = theme_palette.syntax_constant },
          NotifyINFOTitle = { fg = theme_palette.green_primary },
          NotifyDEBUGTitle = { fg = theme_palette.fg_muted },
          NotifyTRACETitle = { fg = theme_palette.green_secondary },

          -- Telescope - Green accents with readable text
          TelescopeBorder = { fg = theme_palette.border },
          TelescopePromptBorder = { fg = theme_palette.green_primary },
          TelescopeResultsBorder = { fg = theme_palette.border },
          TelescopePreviewBorder = { fg = theme_palette.border },
          TelescopeSelection = { bg = theme_palette.bg_select },
          TelescopeSelectionCaret = { fg = theme_palette.green_bright },
          TelescopePromptPrefix = { fg = theme_palette.green_primary },
          TelescopeMatching = { fg = theme_palette.green_bright },

          -- Git signs - Colorful indicators
          GitSignsAdd = { fg = theme_palette.syntax_string },
          GitSignsChange = { fg = theme_palette.syntax_number },
          GitSignsDelete = { fg = theme_palette.syntax_boolean },
          GitSignsAddNr = { fg = theme_palette.syntax_string },
          GitSignsChangeNr = { fg = theme_palette.syntax_number },
          GitSignsDeleteNr = { fg = theme_palette.syntax_boolean },

          -- Diff colors - Colorful but readable
          DiffAdd = { bg = theme_palette.bg_light, fg = theme_palette.syntax_string },
          DiffChange = { bg = theme_palette.bg_light, fg = theme_palette.syntax_number },
          DiffDelete = { bg = theme_palette.bg_light, fg = theme_palette.syntax_boolean },
          DiffText = { bg = theme_palette.bg_select, fg = theme_palette.green_bright },

          -- Tabs - Green accents
          TabLine = { bg = theme_palette.bg_dark, fg = theme_palette.fg_muted },
          TabLineFill = { bg = theme_palette.bg_dark },
          TabLineSel = { bg = theme_palette.bg_light, fg = theme_palette.green_primary },

          -- Fold - Subtle
          Folded = { bg = theme_palette.bg_light, fg = theme_palette.fg_muted },
          FoldColumn = { fg = theme_palette.fg_muted },

          -- Indent guides - Subtle
          IndentBlanklineChar = { fg = theme_palette.border },
          IndentBlanklineContextChar = { fg = theme_palette.fg_muted },

          -- Diagnostics - Colorful indicators
          DiagnosticError = { fg = theme_palette.syntax_boolean },
          DiagnosticWarn = { fg = theme_palette.syntax_constant },
          DiagnosticInfo = { fg = theme_palette.syntax_number },
          DiagnosticHint = { fg = theme_palette.green_secondary },
          DiagnosticUnderlineError = { undercurl = true, sp = theme_palette.syntax_boolean },
          DiagnosticUnderlineWarn = { undercurl = true, sp = theme_palette.syntax_constant },
          DiagnosticUnderlineInfo = { undercurl = true, sp = theme_palette.syntax_number },
          DiagnosticUnderlineHint = { undercurl = true, sp = theme_palette.green_secondary },

          -- LSP - Subtle highlights
          LspReferenceText = { bg = theme_palette.bg_select },
          LspReferenceRead = { bg = theme_palette.bg_select },
          LspReferenceWrite = { bg = theme_palette.bg_select },

          -- Which-key - Green accents
          WhichKey = { fg = theme_palette.green_primary },
          WhichKeyGroup = { fg = theme_palette.syntax_number },
          WhichKeyDesc = { fg = theme_palette.fg_normal },
          WhichKeySeperator = { fg = theme_palette.fg_muted },
          WhichKeyFloat = { bg = theme_palette.bg_popup },
          WhichKeyBorder = { fg = theme_palette.border },

          -- NeoTree (if you switch back) - Green accents
          NeoTreeNormal = { bg = theme_palette.bg_dark, fg = theme_palette.fg_normal },
          NeoTreeNormalNC = { bg = theme_palette.bg_dark, fg = theme_palette.fg_normal },
          NeoTreeDirectoryIcon = { fg = theme_palette.green_primary },
          NeoTreeDirectoryName = { fg = theme_palette.fg_normal },
          NeoTreeFileIcon = { fg = theme_palette.green_secondary },
          NeoTreeFileName = { fg = theme_palette.fg_normal },
          NeoTreeRootName = { fg = theme_palette.green_bright, bold = true },

          -- Dashboard/Alpha - Green accents
          AlphaShortcut = { fg = theme_palette.green_primary },
          AlphaHeader = { fg = theme_palette.green_bright },
          AlphaHeaderLabel = { fg = theme_palette.green_primary },
          AlphaFooter = { fg = theme_palette.syntax_number },
          AlphaButtons = { fg = theme_palette.fg_normal },

          -- Lualine - Green accents
          lualine_a_normal = { bg = theme_palette.green_primary, fg = theme_palette.bg_dark, bold = true },
          lualine_b_normal = { bg = theme_palette.bg_light, fg = theme_palette.green_primary },
          lualine_c_normal = { bg = theme_palette.bg_dark, fg = theme_palette.fg_normal },

          -- Mason - Green accents
          MasonHeader = { bg = theme_palette.green_primary, fg = theme_palette.bg_dark, bold = true },
          MasonHeaderSecondary = { bg = theme_palette.green_secondary, fg = theme_palette.bg_dark, bold = true },
          MasonHighlight = { fg = theme_palette.green_bright },
          MasonHighlightBlock = { bg = theme_palette.green_primary, fg = theme_palette.bg_dark },
          MasonHighlightBlockBold = { bg = theme_palette.green_primary, fg = theme_palette.bg_dark, bold = true },
          MasonMuted = { fg = theme_palette.fg_muted },
          MasonMutedBlock = { bg = theme_palette.bg_light, fg = theme_palette.fg_muted },
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")

      -- Additional green theme setup
      vim.defer_fn(function()
        -- Ensure notification colors match with better readability
        vim.cmd([[
          highlight NotifyINFOBorder guifg=#9ece6a
          highlight NotifyINFOTitle guifg=#9ece6a
          highlight NotifyINFOIcon guifg=#9ece6a
          highlight NotifyBackground guibg=#1a1a1a
          highlight NotifyINFOBody guifg=#ffffff
        ]])

        vim.notify("🌿 Balanced green theme loaded successfully!", vim.log.levels.INFO)
      end, 100)
    end,
  },
}
