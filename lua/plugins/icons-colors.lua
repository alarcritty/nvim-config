-- lua/config/icon-colors.lua
-- Create this as a separate file to force icon colors

local M = {}

function M.setup()
  -- Your green colors
  local green = "#50fa7b"
  local green2 = "#8be9fd"
  local green3 = "#69ff94"

  -- Wait for everything to load, then force override
  vim.defer_fn(function()
    -- Nuclear option: Override ALL possible devicon highlight groups
    local highlight_groups = {
      "DevIconLua",
      "DevIconJs",
      "DevIconTs",
      "DevIconJsx",
      "DevIconTsx",
      "DevIconJson",
      "DevIconMd",
      "DevIconPy",
      "DevIconHtml",
      "DevIconCss",
      "DevIconVim",
      "DevIconSh",
      "DevIconZsh",
      "DevIconTxt",
      "DevIconLog",
      "DevIconConf",
      "DevIconConfig",
      "DevIconYml",
      "DevIconYaml",
      "DevIconToml",
      "DevIconRs",
      "DevIconGo",
      "DevIconPhp",
      "DevIconJava",
      "DevIconCpp",
      "DevIconC",
      "DevIconRb",
      "DevIconDefault",
      "DevIconGitignore",
      "DevIconPackageJson",
      "DevIconPackageLockJson",
      "DevIconReadme",
      "DevIconMakefile",
      "DevIconDockerfile",
      "DevIconEnv",
    }

    for _, group in ipairs(highlight_groups) do
      vim.cmd(string.format("hi! %s guifg=%s", group, green))
    end

    -- Also try linking them to a green highlight
    vim.cmd("hi! GreenIcon guifg=" .. green)
    for _, group in ipairs(highlight_groups) do
      vim.cmd(string.format("hi! link %s GreenIcon", group))
    end

    print("Applied green icon overrides!")
  end, 3000) -- Wait 3 seconds for everything to load
end

return M
