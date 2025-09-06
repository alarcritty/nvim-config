
# 🚀 My Neovim Configuration

A blazing fast, minimal, and highly customized Neovim setup built on LazyVim framework. Optimized for productivity, aesthetic appeal, and pure keyboard-driven workflow.

## ✨ Features

- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast startup and lazy loading
- **Color Scheme**: Solarized Osaka for elegant syntax highlighting
- **LSP Integration**: Full language server protocol support with formatting and diagnostics
- **Fuzzy Finding**: Telescope with FZF for lightning-fast file navigation
- **Git Integration**: Built-in git blame and repository browsing
- **Syntax Highlighting**: Treesitter for accurate code parsing
- **Color Preview**: Live color highlighting for CSS/web development
- **Window Management**: Seamless split navigation and resizing
- **Time Tracking**: WakaTime integration for coding analytics

## 📁 Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua       # Auto commands and file type settings
│   │   ├── keymaps.lua        # Custom key mappings
│   │   ├── lazy.lua           # LazyVim bootstrap
│   │   └── options.lua        # Neovim options and settings
│   ├── plugins/
│   │   ├── coding.lua         # Coding-related plugins (telescope, git, etc.)
│   │   └── wakatime.lua       # Time tracking plugin
│   └── util/
│       └── debug.lua          # Debug utilities
├── lazy-lock.json             # Plugin version lock file
└── lazyvim.json              # LazyVim configuration
```

## 🔧 Installation

### Prerequisites

- **Neovim** >= 0.9.0
- **Git**
- **Node.js** (for LSP servers)
- **Python** with pip (for WakaTime)
- **ripgrep** (for telescope live grep)
- **fd** (for better file finding)

### Setup

1. **Backup existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone https://github.com/yourusername/nvim-config ~/.config/nvim
   ```

3. **Install WakaTime CLI**:
   ```bash
   pip install wakatime
   ```

4. **Launch Neovim**:
   ```bash
   nvim
   ```
   
   LazyVim will automatically install all plugins on first startup.

## ⚡ Key Features & Mappings

### Leader Key
- **Leader**: `<Space>`

### File Navigation
- `<Space>ff` - Find files
- `<Space>fg` - Live grep
- `<Space>fb` - File browser
- `;;` - Resume last telescope search
- `sf` - Open file browser in current directory

### Git Integration
- `<Space>gb` - Git blame
- `<Space>go` - Open in browser

### Window Management
- `ss` - Horizontal split
- `sv` - Vertical split
- `sh/sj/sk/sl` - Navigate splits
- `<Ctrl-w>` + arrows - Resize windows

### Coding Enhancements
- `<Space>p` - Paste from yank register (doesn't overwrite)
- `<Space>d` - Delete without affecting clipboard
- `gcc` - Toggle line comment
- `<Ctrl-j>` - Next diagnostic
- `<Space>r` - Replace hex colors with HSL
- `<Space>i` - Toggle inlay hints

### Productivity
- `<Ctrl-s>` - Save file
- `<Ctrl-q>` - Quit
- `<Tab>/<Shift-Tab>` - Navigate tabs
- `<Ctrl-a>` - Select all

## 🎨 Plugins

### Core Plugins
- **LazyVim**: Base framework with sensible defaults
- **Telescope**: Fuzzy finder for files, text, and more
- **Treesitter**: Advanced syntax highlighting
- **LSP**: Language server integration
- **Which-key**: Keybinding hints

### Additional Plugins
- **nvim-highlight-colors**: Live color preview
- **git.nvim**: Git integration and browsing
- **close-buffers.nvim**: Buffer management
- **telescope-file-browser**: Enhanced file browsing
- **vim-wakatime**: Automatic time tracking

## 🛠️ Customization

### Adding New Plugins
Create a new file in `lua/plugins/` directory:

```lua
return {
  "author/plugin-name",
  event = "VeryLazy",
  opts = {
    -- plugin configuration
  },
}
```

### Custom Keymaps
Add to `lua/config/keymaps.lua`:

```lua
local keymap = vim.keymap
keymap.set("n", "<leader>x", ":YourCommand<CR>", { desc = "Your Description" })
```

### LSP Configuration
Language servers are automatically configured through LazyVim's extras system.

## 📊 Performance

- **Startup Time**: ~50ms (with lazy loading)
- **Plugin Count**: 50+ plugins (loaded on demand)
- **Memory Usage**: Minimal footprint with intelligent caching

## 🎯 Philosophy

This configuration follows the principle of **"maximum productivity with minimal friction"**:

- Every keystroke has purpose
- Visual distractions are eliminated
- Common workflows are optimized
- Extensibility without complexity

## 🤝 Contributing

Feel free to fork and adapt this configuration to your needs. If you find improvements or fixes, pull requests are welcome!

## 📝 License

This configuration is open source and available under the MIT License.

## 🙏 Credits

This configuration is heavily inspired by and built upon the excellent work of [Takuya Matsuyama (craftzdog)](https://github.com/craftzdog/dotfiles-public). His thoughtful approach to Neovim configuration and LazyVim setup served as the foundation for this personalized version.

Special thanks to:
- **[craftzdog](https://github.com/craftzdog)** - For the original configuration structure and inspiration
- **[LazyVim](https://github.com/LazyVim/LazyVim)** - For the amazing Neovim framework
- **[folke](https://github.com/folke)** - For lazy.nvim and many other essential plugins

