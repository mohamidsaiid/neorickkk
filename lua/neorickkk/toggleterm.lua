return {
	"akinsho/toggleterm.nvim",
	version = "*", -- Use the latest stable version
	opts = {
		size = 20, -- Width of the terminal (adjust as needed)
		open_mapping = nil, -- We'll handle the keymap manually to avoid conflicts
		hide_numbers = true, -- Hide line numbers in the terminal
		shade_terminals = true, -- Slight transparency for better focus
		shading_factor = 2, -- Opacity level (higher = more transparent)
		start_in_insert = true, -- Start in insert mode for immediate typing
		insert_mappings = true, -- Allow basic insert mode mappings
		terminal_mappings = true, -- Allow terminal-specific mappings
		persist_size = true, -- Remember terminal size across sessions
		direction = "float", -- Floating window mode
		close_on_exit = true, -- Close the terminal when the process exits
		shell = vim.o.shell, -- Use your default shell (e.g., bash, zsh)
		float_opts = {
			border = "curved", -- Nice rounded borders (options: "single", "double", "shadow", etc.)
			winblend = 0, -- Background transparency (0-100; 0 = opaque)
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
		vim.keymap.set("n", "<leader>t", ":ToggleTerm<cr>", { desc = "Toggle floating terminal" })
		--vim.keymap.set("n", "<leader>t", ":tabnew<CR>:terminal<CR>")
		local function set_terminal_keymaps()
			local keyMapOpts = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], keyMapOpts)
			vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], keyMapOpts) -- Optional: jk to exit
			vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]],keyMapOpts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], keyMapOpts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], keyMapOpts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], keyMapOpts)
		end

		-- Auto-set keymaps on terminal open
		vim.api.nvim_create_autocmd("TermOpen", { callback = set_terminal_keymaps })
	end,
}
