-- VS Code-style git gutter + inline blame + hunk staging.
-- Keymaps live under <leader>v (version control); ]h / [h jump between hunks.
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged_enable = true,
		numhl = false,
		linehl = false,
		-- VS Code "GitLens"-style inline blame on the current line.
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 300,
			ignore_whitespace = true,
		},
		current_line_blame_formatter = "  <author>, <author_time:%R> • <summary>",
		preview_config = { border = "rounded" },
		attach_to_untracked = true,
		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
			end

			-- Navigate hunks (falls back to native diff jumps inside :diffthis views).
			map("n", "]h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gs.nav_hunk("next")
				end
			end, "Next git hunk")
			map("n", "[h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gs.nav_hunk("prev")
				end
			end, "Previous git hunk")

			-- Stage / unstage / discard, like VS Code's hunk gutter actions.
			map("n", "<leader>vs", gs.stage_hunk, "Stage hunk (toggle)")
			map("n", "<leader>vr", gs.reset_hunk, "Discard hunk")
			map("v", "<leader>vs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage selection")
			map("v", "<leader>vr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Discard selection")
			map("n", "<leader>vS", gs.stage_buffer, "Stage whole file")
			map("n", "<leader>vR", gs.reset_buffer, "Discard all changes in file")

			-- Inspect
			map("n", "<leader>vp", gs.preview_hunk_inline, "Preview hunk inline")
			map("n", "<leader>vP", gs.preview_hunk, "Preview hunk (popup)")
			map("n", "<leader>vb", function()
				gs.blame_line({ full = true })
			end, "Blame line (full commit)")
			map("n", "<leader>vB", gs.blame, "Blame whole file")
			map("n", "<leader>vd", gs.diffthis, "Diff file against index")
			map("n", "<leader>vD", function()
				gs.diffthis("~")
			end, "Diff file against last commit")

			-- Toggles
			map("n", "<leader>vt", gs.toggle_current_line_blame, "Toggle inline blame")
			map("n", "<leader>vw", gs.toggle_word_diff, "Toggle word diff")
			map("n", "<leader>vq", function()
				gs.setqflist("all")
			end, "All hunks to quickfix")

			-- Hunk text object: `vih`, `dih`, etc.
			map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
		end,
	},
}
