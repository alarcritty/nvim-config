return {
  "nvim-tree/nvim-tree.lua",
  version = false,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Define your theme's actual green color palette
    local theme_colors = {
      primary_green = "#7aa874", -- Main green from your theme
      light_green = "#9ece6a",   -- Brighter green for folders/active items
      dark_green = "#41a6b5",    -- Teal-green for contrast
      accent_green = "#73daca",  -- Cyan-green accent
      muted_green = "#565f89",   -- Muted blue-gray
      bright_green = "#b9f27c",  -- Bright highlight green
      folder_green = "#7aa874",  -- Specific folder color
      file_green = "#9ece6a",    -- File icon color
    }

    -- Setup web-devicons with your green theme colors
    require("nvim-web-devicons").setup({
      override = {
        zsh = {
          icon = "",
          color = theme_colors.light_green,
          cterm_color = "65",
          name = "Zsh",
        },
        lua = {
          icon = "",
          color = theme_colors.primary_green,
          name = "Lua",
        },
        js = {
          icon = "",
          color = theme_colors.accent_green,
          name = "Js",
        },
        ts = {
          icon = "",
          color = theme_colors.dark_green,
          name = "Ts",
        },
        json = {
          icon = "",
          color = theme_colors.bright_green,
          name = "Json",
        },
        md = {
          icon = "",
          color = theme_colors.light_green,
          name = "Md",
        },
        css = {
          icon = "",
          color = theme_colors.accent_green,
          name = "Css",
        },
        html = {
          icon = "",
          color = theme_colors.primary_green,
          name = "Html",
        },
        py = {
          icon = "",
          color = theme_colors.light_green,
          name = "Python",
        },
        go = {
          icon = "",
          color = theme_colors.dark_green,
          name = "Go",
        },
        rust = {
          icon = "",
          color = theme_colors.muted_green,
          name = "Rust",
        },
      },
      color_icons = true,
      default = true,
      strict = true,
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = theme_colors.muted_green,
          name = "Gitignore",
        },
        ["package.json"] = {
          icon = "",
          color = theme_colors.primary_green,
          name = "PackageJson",
        },
        ["package-lock.json"] = {
          icon = "",
          color = theme_colors.dark_green,
          name = "PackageLockJson",
        },
        ["README.md"] = {
          icon = "",
          color = theme_colors.light_green,
          name = "Readme",
        },
        ["Dockerfile"] = {
          icon = "",
          color = theme_colors.accent_green,
          name = "Dockerfile",
        },
        [".env"] = {
          icon = "",
          color = theme_colors.bright_green,
          name = "Env",
        },
      },
      override_by_extension = {
        ["log"] = {
          icon = "",
          color = theme_colors.muted_green,
          name = "Log",
        },
        ["js"] = {
          icon = "",
          color = theme_colors.accent_green,
          name = "Js",
        },
        ["ts"] = {
          icon = "",
          color = theme_colors.dark_green,
          name = "Ts",
        },
        ["jsx"] = {
          icon = "",
          color = theme_colors.primary_green,
          name = "Jsx",
        },
        ["tsx"] = {
          icon = "",
          color = theme_colors.light_green,
          name = "Tsx",
        },
        ["json"] = {
          icon = "",
          color = theme_colors.bright_green,
          name = "Json",
        },
        ["md"] = {
          icon = "",
          color = theme_colors.light_green,
          name = "Md",
        },
        ["yaml"] = {
          icon = "",
          color = theme_colors.accent_green,
          name = "Yaml",
        },
        ["yml"] = {
          icon = "",
          color = theme_colors.accent_green,
          name = "Yml",
        },
        ["toml"] = {
          icon = "",
          color = theme_colors.primary_green,
          name = "Toml",
        },
        ["css"] = {
          icon = "",
          color = theme_colors.dark_green,
          name = "Css",
        },
        ["scss"] = {
          icon = "",
          color = theme_colors.light_green,
          name = "Scss",
        },
        ["html"] = {
          icon = "",
          color = theme_colors.primary_green,
          name = "Html",
        },
        ["py"] = {
          icon = "",
          color = theme_colors.light_green,
          name = "Python",
        },
        ["go"] = {
          icon = "",
          color = theme_colors.dark_green,
          name = "Go",
        },
        ["rs"] = {
          icon = "",
          color = theme_colors.muted_green,
          name = "Rust",
        },
        ["lua"] = {
          icon = "",
          color = theme_colors.primary_green,
          name = "Lua",
        },
      },
    })

    -- Setup nvim-tree
    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,

      update_focused_file = {
        enable = true,
        update_cwd = true,
      },

      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = {},
        exclude = {},
      },

      view = {
        width = 40,
        side = "left",
        preserve_window_proportions = true,
        number = false,
        relativenumber = false,
      },

      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "name",
        root_folder_modifier = ":~",

        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },

        icons = {
          webdev_colors = false,
          git_placement = "before",
          modified_placement = "after",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
          },
          glyphs = {
            default = "󰈚",
            symlink = "",
            bookmark = "󰆤",
            modified = "●",
            folder = {
              arrow_closed = "󰅂",
              arrow_open = "󰅀",
              default = "󰉋",
              open = "󰝰",
              empty = "󰉖",
              empty_open = "󰷏",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },

      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
      },

      modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },

      diagnostics = {
        enable = false,
      },

      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        expand_all = {
          max_folder_discovery = 300,
          exclude = {},
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            picker = "default",
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },

      trash = {
        cmd = "gio trash",
        require_confirm = true,
      },

      live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
      },

      tab = {
        sync = {
          open = false,
          close = false,
          ignore = {},
        },
      },

      notify = {
        threshold = vim.log.levels.INFO,
      },

      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          dev = false,
          diagnostics = false,
          git = false,
          profile = false,
          watcher = false,
        },
      },
    })

    -- Set custom highlight groups to match your theme
    local function set_highlights()
      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = theme_colors.primary_green })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderIcon", { fg = theme_colors.light_green })
      vim.api.nvim_set_hl(0, "NvimTreeFileIcon", { fg = theme_colors.accent_green })
      vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = theme_colors.bright_green })
      vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = theme_colors.light_green })
      vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = theme_colors.dark_green })
      vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = theme_colors.primary_green, bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeFolderArrowClosed", { fg = theme_colors.muted_green })
      vim.api.nvim_set_hl(0, "NvimTreeFolderArrowOpen", { fg = theme_colors.light_green })
      vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = theme_colors.muted_green })

      -- Git status colors
      vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = theme_colors.bright_green })
      vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = theme_colors.light_green })
      vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = theme_colors.accent_green })
      vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = theme_colors.primary_green })
      vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = theme_colors.bright_green })
      vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = theme_colors.muted_green })
    end

    -- Apply highlights after a delay
    vim.defer_fn(function()
      set_highlights()

      -- Force reload icons
      pcall(function()
        require("nvim-web-devicons").refresh()
      end)

      vim.notify("✅ Green theme applied successfully!", vim.log.levels.INFO)
    end, 100)
  end,
}
