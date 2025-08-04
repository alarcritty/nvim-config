return {
  "wakatime/vim-wakatime",
  lazy = false,
  config = function()
    -- Python binary path (adjust if needed)
    local python_paths = {
      "/usr/bin/python3",
      "/usr/local/bin/python3",
      "/opt/homebrew/bin/python3", -- macOS with Homebrew
      vim.fn.exepath("python3"),
      vim.fn.exepath("python"),
    }
    for _, path in ipairs(python_paths) do -- Fixed: use _ instead of *
      if vim.fn.executable(path) == 1 then
        vim.g.wakatime_PythonBinary = path
        break
      end
    end
    -- Additional settings
    vim.g.wakatime_ScreenRedraw = 1
    -- Optional: Set up autocmd for better integration
    local wakatime_group = vim.api.nvim_create_augroup("WakaTime", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      group = wakatime_group,
      pattern = "*",
      callback = function()
        -- You can add custom logic here if needed
        -- For example, excluding certain file types
        local excluded_filetypes = { "help", "alpha", "dashboard" }
        if not vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
          -- WakaTime will automatically track this
        end
      end,
    })
  end,
}
