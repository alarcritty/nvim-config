# 🚀 Neovim Configuration

A modern, fast, and feature-rich Neovim configuration designed for developers who want a powerful editing experience with beautiful aesthetics and smooth performance.

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)

## ✨ Features

- 📦 **Plugin Management**: Efficient plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🚀 **Dashboard**: Beautiful startup screen with [alpha.nvim](https://github.com/goolord/alpha-nvim)
- 🖌️ **Custom Colorscheme**: Carefully configured theme setup
- 🧹 **Auto-formatting**: Automatic code formatting for multiple languages
- 🔍 **Fuzzy Finding**: Powerful file and text search with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- 📁 **File Explorer**: Intuitive file navigation using [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- 🖱️ **Status Line**: Clean and informative statusline with [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- 🎨 **Icons & Colors**: Custom icon and color configurations
- ⏱️ **Time Tracking**: Built-in [WakaTime](https://wakatime.com/) integration for coding analytics
- 🔧 **Sign Integration**: Comprehensive sign configurations for diagnostics and git
- ⌨️ **Optimized Keymaps**: Thoughtfully designed keybindings for enhanced productivity
- 🎯 **Modular Design**: Well-organized configuration with separate files for each feature

## 📁 Structure

```
~/.config/nvim/
├── .git/                    # Git repository
├── lua/
│   ├── config/              # Core configuration files
│   │   ├── autocmds.lua     # Auto-commands
│   │   ├── keymaps.lua      # Keybinding configurations
│   │   ├── lazy.lua         # Lazy.nvim plugin manager setup
│   │   ├── options.lua      # Neovim options and settings
│   │   └── signs.lua        # Sign configurations (diagnostics, git, etc.)
│   └── plugins/             # Individual plugin configurations
│       ├── alpha.lua        # Dashboard/startup screen
│       ├── autoformatting.lua # Auto-formatting setup
│       ├── colorscheme.lua  # Theme configuration
│       ├── disable-snacks-picker.lua # Snacks picker configuration
│       ├── icons-colors.lua # Icon and color configurations
│       ├── lualine.lua      # Statusline configuration
│       ├── nvim-tree.lua    # File explorer setup
│       ├── telescope.lua    # Fuzzy finder configuration
│       └── wakatime.lua     # Time tracking plugin
├── pack/                    # Neovim package directory
├── .gitignore              # Git ignore file
├── init.lua                # Entry point
├── lazy-lock.json          # Plugin version lockfile
├── lazyvim.json           # LazyVim configuration
└── stylua.toml            # Lua code formatter config
```

## 🛠️ Prerequisites

- **Neovim** (v0.9.0 or higher) - [Install Guide](https://neovim.io/)
- **Git** - For cloning and plugin management
- **Node.js** (optional) - For some LSP servers and tools
- **Python 3** (optional) - For Python-based tools
- A **Nerd Font** - For proper icon display (recommended: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/))

## 🚀 Installation

### Quick Install

```bash
# Backup existing configuration (if any)
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true

# Clone this configuration
git clone https://github.com/alarcritty/nvim-config ~/.config/nvim

# Start Neovim (plugins will install automatically)
nvim
```

### Manual Install

1. **Clone the repository:**

   ```bash
   git clone https://github.com/alarcritty/nvim-config ~/.config/nvim
   ```

2. **Start Neovim:**

   ```bash
   nvim
   ```

3. **Install plugins:**
   - Plugins will automatically install on first startup
   - Or manually run `:Lazy` to open the plugin manager

4. **Install language servers (optional):**
   ```vim
   :Mason
   ```

## ⚙️ Configuration

### Custom Settings

You can customize the configuration by modifying files in the `lua/config/` directory:

- `lua/config/options.lua` - Neovim options and settings
- `lua/config/keymaps.lua` - Custom keybindings
- `lua/config/autocmds.lua` - Auto-commands
- `lua/config/lazy.lua` - Plugin manager configuration
- `lua/config/signs.lua` - Sign configurations

### Adding Plugins

Add new plugins in `lua/plugins/` directory by creating new `.lua` files:

```lua
-- lua/plugins/your-plugin.lua
return {
  "plugin-author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

### Plugin-specific Configurations

Each plugin has its own configuration file in `lua/plugins/`:

- `alpha.lua` - Customize the startup dashboard
- `colorscheme.lua` - Change themes and colors
- `telescope.lua` - Modify fuzzy finder settings
- `nvim-tree.lua` - File explorer customization
- `lualine.lua` - Statusline configuration
- `autoformatting.lua` - Formatting rules and settings

## ⌨️ Key Mappings

### Essential Keybindings

| Key          | Mode   | Action                   |
| ------------ | ------ | ------------------------ |
| `<Space>`    | Normal | Leader key               |
| `<Leader>ff` | Normal | Find files               |
| `<Leader>fg` | Normal | Live grep                |
| `<Leader>fb` | Normal | Find buffers             |
| `<Leader>e`  | Normal | Toggle file explorer     |
| `<Leader>w`  | Normal | Save file                |
| `<Leader>q`  | Normal | Quit                     |
| `gd`         | Normal | Go to definition         |
| `gr`         | Normal | Go to references         |
| `K`          | Normal | Show hover documentation |

_For a complete list of keybindings, check `lua/config/keymaps.lua`_

## 🎨 Customization

### Changing the Colorscheme

Edit `lua/plugins/colorscheme.lua` to customize your theme:

```lua
-- Example: Switch to a different colorscheme
return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
```

### Modifying the Dashboard

Customize your startup screen by editing `lua/plugins/alpha.lua`:

```lua
-- Modify dashboard sections, headers, or buttons
```

### WakaTime Integration

The configuration includes WakaTime for coding time tracking. Configure it in `lua/plugins/wakatime.lua` or install the WakaTime CLI and set up your API key.

### Adding Language Support

1. Configure language-specific settings in the appropriate plugin files
2. Add formatting rules in `lua/plugins/autoformatting.lua`
3. Update `stylua.toml` for Lua-specific formatting preferences

## 🔧 Troubleshooting

### Common Issues

**Plugins not loading:**

```vim
:Lazy clean
:Lazy sync
```

**LSP not working:**

```vim
:Mason
:LspInfo
:checkhealth lsp
```

**Icons not displaying:**

- Install a Nerd Font
- Set your terminal to use the Nerd Font

### Health Check

Run Neovim's health check to diagnose issues:

```vim
:checkhealth
```

## 🤝 Contributing

Contributions are welcome! Please feel free to:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 🙏 Acknowledgments

Special thanks to the amazing Neovim community and plugin authors who make this configuration possible:

- [@folke](https://github.com/folke) - For lazy.nvim, tokyonight, and many other amazing plugins
- [@tjdevries](https://github.com/tjdevries) - For inspiring Neovim configurations
- [@hendrikmi](https://github.com/hendrikmi) - For configuration ideas
- The entire [Neovim](https://github.com/neovim/neovim) team

---

⭐ **If you find this configuration helpful, please consider giving it a star!**
