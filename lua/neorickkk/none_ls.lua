return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.pgformatter,
				--                null_ls.builtins.diagnostics.cpplint,
				--null_ls.builtins.diagnostics.eslint_d.with({
				--	diagnostics_format = "[eslint] #{m}\n(#{c})",
				--}),
			},
		})
		vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format)
	end,
}
