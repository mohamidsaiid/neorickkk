vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("neorickkk-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "]t", vim.cmd.tabnext)
vim.keymap.set("n", "[t", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-y>", ":q<CR>", { noremap = true, silent = true })
--vim.keymap.set("n", "<leader>t", ":tabnew<CR>:terminal<CR>")
