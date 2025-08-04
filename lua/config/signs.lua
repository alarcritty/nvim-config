-- config/signs.lua
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define("NvimTreeDiagnostic" .. type .. "Icon", { text = icon, texthl = hl, numhl = "" })
end
