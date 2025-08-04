-- Disable LazyVim's import order check to work around the snacks_picker issue
vim.g.lazyvim_check_order = false
-- Disable netrw completely BEFORE LazyVim loads
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Add LazyVim but EXCLUDE the file explorer plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
    },
    -- Explicitly disable LazyVim's neo-tree
    { "nvim-neo-tree/neo-tree.nvim", enabled = false },
    -- Your custom plugins (from ~/.config/nvim/lua/plugins/)
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false, -- Always use latest git commit
  },
  install = {
    -- Remove or comment out the fallback colorschemes to prevent override
    -- colorscheme = { "tokyonight", "habamax" },
    missing = true,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tohtml",
        "tutor",
        "zipPlugin",
        "netrw",
        "netrwPlugin",
      },
    },
  },
})

-- Ensure your theme loads after LazyVim setup
-- Add this at the end to force your colorscheme
-- Replace 'your_theme_name' with your actual theme
-- vim.cmd.colorscheme("your_theme_name")
