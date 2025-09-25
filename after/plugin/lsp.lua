-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require 'lspconfig'

require('mason').setup()

local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
    ensure_installed = { "pyright" }
}

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

lspconfig.cssls.setup {
    capabilities = capabilities,
}

lspconfig.bashls.setup {
    capabilities = capabilities,
}

lspconfig.elixirls.setup {
    cmd = { "/home/mohamed/configs/elixir-ls/release/language_server.sh" },
    capabilities = capabilities
}

lspconfig.ruby_lsp.setup {
    cmd = { "bundle", "exec", "ruby-lsp" }, -- ensures it uses the project's version
}

lspconfig.lua_ls.setup {
    cmd = { "./lua-language-server/bin/lua-language-server", "-E", "./lua-language-server/main.lua" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
}

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>Trouble<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })


-- keep track of where we came from
local last_buf, last_pos

-- function to go to definition in-place or in a new tab
local function go_to_definition_in_new_tab_or_current()
    -- record current buffer and cursor position
    last_buf = vim.api.nvim_get_current_buf()
    last_pos = vim.api.nvim_win_get_cursor(0)

    -- prepare LSP params
    local params = vim.lsp.util.make_position_params()
    local current_uri = vim.uri_from_bufnr(last_buf)

    -- ask the LSP for definition(s)
    vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result)
        if err then
            vim.notify("LSP error: " .. err.message, vim.log.levels.ERROR)
            return
        end
        if not result or vim.tbl_isempty(result) then
            vim.notify("Definition not found", vim.log.levels.INFO)
            return
        end

        -- pick the first location (if multiple)
        local def = vim.tbl_islist(result) and result[1] or result
        local target_uri = def.uri or def.targetUri

        if target_uri == current_uri then
            -- same file → just jump there
            local range = def.range or def.targetSelectionRange
            vim.api.nvim_win_set_cursor(0, { range.start.line + 1, range.start.character })
        else
            -- different file → open new tab and jump
            vim.cmd('tabnew')
            vim.lsp.util.jump_to_location(def, 'utf-8')
        end
    end)
end

vim.keymap.set('n', 'gd', function()
    -- save current location
    last_buf = vim.api.nvim_get_current_buf()
    last_pos = vim.api.nvim_win_get_cursor(0)
    -- jump to definition as usual
    vim.lsp.buf.definition()
end, { noremap = true, silent = true, desc = "Go to definition (record position)" })

-- map it to `gD` in normal mode
vim.keymap.set('n', 'gD', go_to_definition_in_new_tab_or_current, {
    noremap = true,
    silent = true,
    desc = "Go to definition (new tab if different file)"
})

-- map `<leader>b` to jump back to the recorded spot
vim.keymap.set('n', '<leader>b', function()
    if not (last_buf and last_pos) then
        vim.notify("No previous location recorded", vim.log.levels.WARN)
        return
    end
    -- switch to the window showing the original buffer (even across tabs)
    local winid = vim.fn.bufwinid(last_buf)
    if winid ~= -1 then
        vim.api.nvim_set_current_win(winid)
    else
        -- if it's not visible, just open the buffer in the current window
        vim.cmd('buffer ' .. last_buf)
    end
    -- restore cursor
    vim.api.nvim_win_set_cursor(0, last_pos)
end, {
    noremap = true,
    silent = true,
    desc = "Jump back to previous location"
})

vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
