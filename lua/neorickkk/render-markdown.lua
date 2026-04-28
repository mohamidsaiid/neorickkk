return {
    "selimacerbas/markdown-preview.nvim",
    dependencies = { "selimacerbas/live-server.nvim" },
    config = function()
        require("markdown_preview").setup({
            instance_mode = "takeover", -- "takeover" or "multi" (see below)
            port = 0,                   -- 0 = auto (8421 for takeover, OS-assigned for multi)
            open_browser = true,        -- auto-open browser on start

            -- nil = system default browser
            -- string = browser name ("Firefox") or binary ("google-chrome")
            -- table = full command, URL appended ({ "google-chrome", "--incognito" })
            -- On macOS, string values are passed via `open -a <name>`.
            browser = nil,

            content_name = "content.md",     -- workspace content file
            index_name = "index.html",       -- workspace HTML file
            workspace_dir = nil,             -- nil = auto (shared for takeover, per-buffer for multi)

            overwrite_index_on_start = true, -- copy plugin's index.html on every start

            auto_refresh = true,             -- auto-update on buffer changes
            auto_refresh_events = {          -- which events trigger refresh
                "InsertLeave", "TextChanged", "TextChangedI", "BufWritePost"
            },
            debounce_ms = 300,         -- debounce interval
            notify_on_refresh = false, -- show notification on refresh

            mermaid_renderer = "js",   -- "js" (browser mermaid.js) or "rust" (mmdr CLI, ~400x faster)

            scroll_sync = true,        -- browser follows cursor position

            -- Fraction (0–1): vertical position of the final line when scrolled to end.
            -- 0.5 = middle of viewport (default), 1.0 = bottom edge (no extra space)
            bottom_padding = 0.5,
        })

        vim.keymap.set("n", "<leader>mps", "<cmd>MarkdownPreview<cr>", { desc = "Markdown: Start preview" })
        vim.keymap.set("n", "<leader>mpS", "<cmd>MarkdownPreviewStop<cr>", { desc = "Markdown: Stop preview" })
        vim.keymap.set("n", "<leader>mpr", "<cmd>MarkdownPreviewRefresh<cr>", { desc = "Markdown: Refresh preview" })
    end,
}
