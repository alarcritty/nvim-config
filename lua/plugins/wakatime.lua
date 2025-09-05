return {
  "wakatime/vim-wakatime",
  lazy = false,
  priority = 1000,
  config = function()
    -- Force the plugin to initialize
    vim.g.wakatime_PythonBinary = vim.fn.exepath('python3') or vim.fn.exepath('python')
  end,
}
