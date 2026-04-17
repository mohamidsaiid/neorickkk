return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        dashboard = { example = "github" },
        indent = { enabled = true },
        picker = {
            enabled = true,
            ignored = true,
            hidden = true,
        },
        notifier = { enabled = true },
    },
    config = function(_, opts)
        local snacks = require("snacks")
        snacks.setup(opts)

        -- Transparent background
        vim.api.nvim_set_hl(0, "SnacksExplorerNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "SnacksExplorerNormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "SnacksExplorerEndOfBuffer", { bg = "none" })

        -- Diagnostics picker with its own specific config
        vim.keymap.set("n", "<leader>d", function()
            snacks.picker.diagnostics({
                ignored = true,
                hidden = true,
                sort = {
                    fields = { "is_current", "is_cwd", "severity", "file", "lnum" },
                },
                matcher = { sort_empty = true },
                filter = { cwd = true },
            })
        end, { desc = "Pick diagnostics" })
    end,
}
