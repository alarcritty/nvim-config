return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "wakatime/vim-wakatime", -- Add Wakatime dependency
    },
    config = function()
      -- Custom minimal theme matching your colorscheme
      local minimal_theme = {
        normal = {
          a = { bg = "#333333", fg = "#ffffff", gui = "bold" },
          b = { bg = "#222222", fg = "#888888" },
          c = { bg = "#111111", fg = "#cccccc" },
        },
        insert = {
          a = { bg = "#88cc88", fg = "#000000", gui = "bold" }, -- Green for insert
          b = { bg = "#222222", fg = "#888888" },
          c = { bg = "#111111", fg = "#cccccc" },
        },
        visual = {
          a = { bg = "#cc88cc", fg = "#000000", gui = "bold" }, -- Magenta for visual
          b = { bg = "#222222", fg = "#888888" },
          c = { bg = "#111111", fg = "#cccccc" },
        },
        replace = {
          a = { bg = "#cc8888", fg = "#000000", gui = "bold" }, -- Red for replace
          b = { bg = "#222222", fg = "#888888" },
          c = { bg = "#111111", fg = "#cccccc" },
        },
        command = {
          a = { bg = "#cccc88", fg = "#000000", gui = "bold" }, -- Yellow for command
          b = { bg = "#222222", fg = "#888888" },
          c = { bg = "#111111", fg = "#cccccc" },
        },
        inactive = {
          a = { bg = "#111111", fg = "#444444" },
          b = { bg = "#111111", fg = "#444444" },
          c = { bg = "#111111", fg = "#444444" },
        },
      }

      local mode = {
        "mode",
        fmt = function(str)
          return " " .. str
        end,
      }

      local filename = {
        "filename",
        file_status = true,
        path = 0,
        color = { fg = "#cccccc" }, -- Match your theme's text color
      }

      local hide_in_width = function()
        return vim.fn.winwidth(0) > 100
      end

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        colored = true,
        diagnostics_color = {
          error = { fg = "#cc8888" }, -- Soft red for errors
          warn = { fg = "#cccc88" },  -- Soft yellow for warnings
          info = { fg = "#88cc88" },  -- Soft green for info
          hint = { fg = "#cc88cc" },  -- Soft magenta for hints
        },
        update_in_insert = false,
        always_visible = false,
        cond = hide_in_width,
      }

      local diff = {
        "diff",
        colored = true,
        diff_color = {
          added = { fg = "#88cc88" },    -- Green for additions
          modified = { fg = "#cccc88" }, -- Yellow for modifications
          removed = { fg = "#cc8888" },  -- Red for deletions
        },
        symbols = { added = " ", modified = " ", removed = " " },
        cond = hide_in_width,
      }

      -- Wakatime component
      local wakatime = {
        function()
          local ok, waka = pcall(vim.fn["wakatime#get_status"])
          if ok and waka ~= "" then
            return " " .. waka
          end
          return ""
        end,
        color = { fg = "#77bb77" }, -- Medium green to match your theme
        cond = hide_in_width,
      }

      -- Git branch with custom color
      local branch = {
        "branch",
        color = { fg = "#88cc88" }, -- Green for git branch
      }

      -- Location with custom color
      local location = {
        "location",
        color = { fg = "#888888" },
      }

      -- Progress with custom color
      local progress = {
        "progress",
        color = { fg = "#888888" },
      }

      -- Encoding with custom color
      local encoding = {
        "encoding",
        color = { fg = "#777777" },
        cond = hide_in_width,
      }

      -- Filetype with custom color
      local filetype = {
        "filetype",
        color = { fg = "#777777" },
        cond = hide_in_width,
      }

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = minimal_theme, -- Use our custom minimal theme
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          disabled_filetypes = { "alpha", "neo-tree" },
          always_divide_middle = true,
          globalstatus = true, -- Single statusline for all windows
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { branch },
          lualine_c = { filename },
          lualine_x = {
            wakatime, -- Add Wakatime here
            diagnostics,
            diff,
            encoding,
            filetype,
          },
          lualine_y = { location },
          lualine_z = { progress },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", path = 1, color = { fg = "#444444" } } },
          lualine_x = { { "location", padding = 0, color = { fg = "#444444" } } },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { "fugitive" },
      })
    end,
  },
  -- Add Wakatime plugin separately to ensure it's loaded
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
}
