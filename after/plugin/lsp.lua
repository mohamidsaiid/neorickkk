-- Set up nvim-cmp.
local cmp = require'cmp'

local trouble = require'trouble'
trouble.setup({})
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping.select_next_item(),  -- Move to next completion item
    ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- Move to previous completion item
    
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmp-cmdline'},
    { name = 'cmp-nvim-lua'},
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require'lspconfig'

-- Replace <YOUR_LSP_SERVER> with the actual LSP server you want to use (e.g., 'tsserver', 'pyright', 'gopls', etc.)
lspconfig.clangd.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

-- Example for TypeScript (tsserver)
lspconfig.ts_ls.setup {
  capabilities = capabilities,
}

-- Example for Python (pyright)
lspconfig.pyright.setup {
  capabilities = capabilities,
}

-- Example for Go (gopls)

lspconfig.gopls.setup {
  capabilities = capabilities,
}

-- Add more LSP servers as needed...
lspconfig.html.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>Trouble<CR>', {})

