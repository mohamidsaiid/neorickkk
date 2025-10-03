# Neorickkk - A Modern Neovim Configuration

A feature-rich Neovim configuration focused on providing a powerful development environment with LSP support, autocompletion, and essential coding features.

## Prerequisites

- Neovim >= 0.11.0
- Git
- A C compiler (for Treesitter)
- Node.js (for some LSP servers)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- ripgrep (for Telescope fuzzy finder)

## Features

- 🚀 Built-in LSP configuration for multiple languages
- 📦 Auto-completion with nvim-cmp
- 🔍 Fuzzy finding with Telescope
- 🌳 File explorer with nvim-tree
- 🎨 Beautiful color schemes (Catppuccin and Rose Pine)
- 📝 Syntax highlighting with Treesitter
- ⚡ Fast file navigation with Harpoon
- 🔄 Git integration with Fugitive
- 💾 Auto-save functionality
- 📊 Diagnostics UI with Trouble
- 🔧 Auto-formatting support

## Installation

### 1. Backup your existing Neovim configuration

```bash
mv ~/.config/nvim ~/.config/nvim.backup
rm -rf $HOME/.local/share/nvim
rm -rf $HOME/.local/state/nvim
```

### 2. Clone this configuration

```bash
git clone --depth 1 https://github.com/mohamidsaiid/neorickkk ~/.config/nvim
```
### 4. Install plugins

Launch Neovim and run:

```
:Lazy
```
## Key Bindings

### General

- `<Space>` - Leader key
- `<leader>pv` - Open file explorer
- `<leader>t` - Open new terminal in tab
- `]t` - Next tab
- `[t` - Previous tab

### LSP

- `gd` - Go to definition
- `gD` - Go to definition in new tab
- `gr` - Show references
- `K` - Show hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>f` - Format code
- `<leader>b` - Jump back to previous location

### Trouble (Diagnostics)

- `<leader>xx` - Toggle Trouble window

### Version Control

- Integrated with vim-fugitive for Git operations

### File Navigation

- Configured with Harpoon for quick file navigation
- Telescope for fuzzy finding

## Additional Features

- Relative line numbers
- 4-space indentation
- Smart indentation
- No line wrapping
- Undo persistence
- Case-insensitive search
- Auto-save functionality
- Yank highlighting
- Terminal integration

## Included Language Servers

- Lua
- TypeScript
- Python
- Go
- C/C++
- HTML
- Bash

## Customization

You can customize this configuration by editing the following files:

- `lua/neorickkk/set.lua` - General Neovim settings
- `lua/neorickkk/remap.lua` - Key mappings

## Troubleshooting

If you encounter any issues:

1. Make sure all prerequisites are installed
2. Run `:checkhealth` in Neovim
3. Ensure language servers are installed via `:Mason`
4. Check the error messages in `:messages`
