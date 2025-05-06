-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "rose-pine/neovim", as = "rose-pine" }
    use(
        'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }
    )
    use('nvim-treesitter/playground')

    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }

    use {
        'nvim-tree/nvim-tree.lua',
        'nvim-tree/nvim-web-devicons',
    }
    use {
        'neovim/nvim-lspconfig',  -- Configurations for Nvim LSP
        'hrsh7th/nvim-cmp',       -- Autocompletion plugin
        'hrsh7th/cmp-nvim-lsp',   -- LSP source for nvim-cmp
        'L3MON4D3/LuaSnip',       -- Snippets plugin
        'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
        'hrsh7th/cmp-buffer',     -- Buffer source for nvim-cmp
        'hrsh7th/cmp-path',       -- Path source for nvim-cmp
        'hrsh7th/cmp-cmdline',    -- Command line source for nvim-cmp
    }

    use {
        'folke/trouble.nvim',    -- diagnostics UI
        'nvim-lualine/lualine.nvim', -- statusline (optional)
    }
    use {'Pocco81/auto-save.nvim'}
end)
