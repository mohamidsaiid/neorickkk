return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>g", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
	},
	config = function()
		local group = vim.api.nvim_create_augroup("neorickkk-lazygit", { clear = true })

		-- Terminal-mode maps that other plugins may install on every terminal
		-- buffer. lazygit needs these keys raw, so strip them from its buffer.
		local stolen_keys = { "jk", "<esc>", "<C-h>", "<C-j>", "<C-k>", "<C-l>" }

		local function enter_terminal_mode(buf)
			vim.schedule(function()
				if not vim.api.nvim_buf_is_valid(buf) then
					return
				end
				-- Only if this buffer is still the one we're sitting in.
				if vim.api.nvim_get_current_buf() ~= buf then
					return
				end
				if vim.bo[buf].buftype ~= "terminal" then
					return
				end
				vim.cmd("startinsert")
			end)
		end

		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = "lazygit",
			callback = function(args)
				local buf = args.buf

				for _, lhs in ipairs(stolen_keys) do
					pcall(vim.api.nvim_buf_del_keymap, buf, "t", lhs)
				end

				-- If we do end up in normal mode here, quit through lazygit's own
				-- exit path so its on_exit closes the window and resets state,
				-- instead of :q leaving the job orphaned (see <C-y> in remap.lua).
				local function quit_lazygit()
					local chan = vim.bo[buf].channel
					if chan and chan > 0 then
						vim.cmd("startinsert")
						vim.api.nvim_chan_send(chan, "q")
					end
				end

				local keyMapOpts = { buffer = buf, noremap = true, silent = true, desc = "Quit LazyGit" }
				vim.keymap.set("n", "<C-y>", quit_lazygit, keyMapOpts)
				vim.keymap.set("n", "q", quit_lazygit, keyMapOpts)

				enter_terminal_mode(buf)
			end,
		})

		-- Coming back to the float should return to terminal mode, not leave it
		-- sitting there inert.
		vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
			group = group,
			callback = function(args)
				if vim.bo[args.buf].filetype ~= "lazygit" then
					return
				end
				enter_terminal_mode(args.buf)
			end,
		})
	end,
}
