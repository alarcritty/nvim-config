
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,

    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "dart",
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

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental = "<M-space>",
        },
      },

      indent = {
        enable = true,
      },

      auto_install = true,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
}
