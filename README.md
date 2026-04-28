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

- 🚀 Built-in LSP configuration for multiple languages (Lua, TypeScript, Python, Go, C/C++, Rust, Prisma, PostgreSQL)
- 📦 Auto-completion with nvim-cmp
- 🔍 Fuzzy finding with Telescope (files, grep, git status)
- 🌳 File explorer with NvimTree
- 🎨 Beautiful color schemes (Dracula, Kanagawa, Tokyo Night)
- 📝 Syntax highlighting with Treesitter
- ⚡ Fast file navigation with Harpoon v2
- ✔️ Git indicators with Gitsigns
- 💾 Auto-save functionality
- 📊 Diagnostics UI with Trouble
- 🔧 Auto-formatting with none-ls
- 💻 Toggle floating terminal with ToggleTerm
- 📈 Status line with Lualine
- 📐 Indent guides with Indent Blankline
- 💬 Code commenting with Comment.nvim
- 📋 Dashboard start screen
- 🗂️ Buffer management with Bufferin
- 🌐 Live Server for web development (auto-reload)
- 📄 Markdown rendering with render-markdown
- 🛠️ Diagnostics message customization

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

### 3. Install plugins

Launch Neovim and run:

```
:Lazy
```

## Key Bindings

### Leader Key
- `<Space>` - Leader key

### General
- `<leader>e` - Toggle file explorer (NvimTree)
- `<leader>r` - Refresh NvimTree
- `<leader>t` - Toggle floating terminal
- `<leader>d` - Pick diagnostics (Snacks)
- `]t` - Next tab
- `[t` - Previous tab
- `<C-y>` - Quit file (`:q`)

### Telescope (Fuzzy Finder)
- `<leader>p` - Find files
- `<leader>fg` - Live grep
- `<leader>fh` - Live grep current file
- `<leader>fs` - Git status

### LSP
- `gd` - Go to definition
- `gD` - Go to definition (new tab if different file, current tab if same)
- `gr` - Show references
- `K` - Show hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>f` - Format code
- `<leader>b` - Jump back to previous location
- `]g` - Next diagnostic
- `[g` - Previous diagnostic

### Trouble (Diagnostics)
- `<leader>xx` - Toggle diagnostics (Trouble)
- `<leader>xX` - Buffer diagnostics (Trouble)
- `<leader>cs` - Symbols (Trouble)
- `<leader>cl` - LSP definitions/references (Trouble)
- `<leader>xL` - Location list (Trouble)
- `<leader>xQ` - Quickfix list (Trouble)

### Harpoon v2 (Quick File Navigation)
- `<leader>a` - Add file to Harpoon list
- `<leader>h` - Toggle Harpoon quick menu
- `<C-h>` - Select Harpoon item 1
- `<C-t>` - Select Harpoon item 2
- `<C-n>` - Select Harpoon item 3
- `<C-s>` - Select Harpoon item 4
- `<C-S-P>` - Previous Harpoon item
- `<C-S-N>` - Next Harpoon item

### Live Server
- `<leader>ls` - Start Live Server (pick path & port)
- `<leader>lo` - Open server in browser
- `<leader>lr` - Force reload
- `<leader>lt` - Toggle live-reload
- `<leader>li` - Show server status
- `<leader>lS` - Stop server
- `<leader>lA` - Stop all servers

### Markdown Preview
- `<leader>mps` - Start markdown preview
- `<leader>mpS` - Stop markdown preview
- `<leader>mpr` - Refresh markdown preview

### Terminal Mode (ToggleTerm)
- `<esc>` / `jk` - Exit insert mode
- `<C-h/j/k/l>` - Navigate windows

## Included Language Servers

- Lua (lua_ls)
- TypeScript (ts_ls)
- Python (pyright)
- Go (gopls)
- C/C++ (clangd)
- Rust (rust_analyzer)
- Prisma (prisma-language-server)
- PostgreSQL (postgres-language-server)

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
- Live-reload for web development

## Customization

All configuration modules are located in `lua/neorickkk/`. Edit the respective module files to customize:

- `lua/neorickkk/lsp-config.lua` - LSP settings
- `lua/neorickkk/telescope.lua` - Telescope settings
- `lua/neorickkk/tree.lua` - NvimTree settings
- `lua/neorickkk/toggleterm.lua` - ToggleTerm settings
- `lua/neorickkk/lualine.lua` - Status line settings
- `lua/neorickkk/auto-compelete.lua` - Autocompletion settings
- `lua/neorickkk/live-server.lua` - Live Server settings
- Other modules: comment, dashboard, gitsigns, harpoon2, indent-blankline, none_ls, render-markdown, treesitter, etc.

## Troubleshooting

If you encounter any issues:

1. Make sure all prerequisites are installed
2. Run `:checkhealth` in Neovim
3. Ensure language servers are installed via `:Mason`
4. Check the error messages in `:messages`
5. Review module files in `lua/neorickkk/` for configuration errors
