-- Side-by-side diffs, file history and a 3-way merge tool, like VS Code's
-- Source Control diff editor and timeline.
return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
	keys = {
		{ "<leader>vv", "<cmd>DiffviewOpen<cr>", desc = "Diff view: working tree vs index" },
		{ "<leader>vm", "<cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>", desc = "Diff view: branch vs origin" },
		{ "<leader>vc", "<cmd>DiffviewClose<cr>", desc = "Diff view: close" },
		{ "<leader>vh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current file)" },
		{ "<leader>vH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
		{ "<leader>vh", ":'<,'>DiffviewFileHistory<cr>", mode = "v", desc = "History of selected lines" },
	},
	opts = {
		enhanced_diff_hl = true,
		use_icons = true,
		view = {
			default = { layout = "diff2_horizontal", winbar_info = true },
			merge_tool = { layout = "diff3_mixed", disable_diagnostics = true, winbar_info = true },
			file_history = { layout = "diff2_horizontal", winbar_info = true },
		},
		file_panel = {
			listing_style = "tree",
			win_config = { position = "left", width = 35 },
		},
		hooks = {
			diff_buf_read = function(bufnr)
				-- Keep diff buffers readable: no wrap, no cursorline noise.
				vim.opt_local.wrap = false
				vim.opt_local.list = false
			end,
		},
	},
}
