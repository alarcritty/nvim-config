-- Temporarily disable the broken snacks_picker extra
return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- Disable the snacks_picker extra that's causing the button error
      extras = {
        ["lazyvim.plugins.extras.editor.snacks_picker"] = false,
      },
    },
  },
}