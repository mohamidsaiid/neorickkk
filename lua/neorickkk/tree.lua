return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true
		require("nvim-tree").setup({
			renderer = {
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "󰈚", -- nf-md-file
						symlink = "󰉐", -- nf-md-link
						folder = {
							default = "󰉋", -- nf-md-folder
							open = "󰝰", -- nf-md-folder_open
							empty = "󰉖", -- nf-md-folder_outline
							empty_open = "󰷏", -- custom
							symlink = "󰉒", -- nf-md-folder_symlink
							arrow_open = "", -- nf-oct-chevron_down
							arrow_closed = "", -- nf-oct-chevron_right
						},
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					info = "", -- nf-fa-info_circle
					warning = "", -- nf-fa-warning
					error = "", -- nf-fa-times_circle
				},
			},
			-- keep the rest from previous setup
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			auto_reload_on_write = true,
			filesystem_watchers = {
				enable = true,
				debounce_delay = 10,
			},
			git = {
				enable = true,
				ignore = false,
				show_on_dirs = true,
			},
			view = {
				width = 30,
                number = true,
                relativenumber = true,
				side = "left",
                debounce_delay = 10,


			},
		})
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
		vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { desc = "Refresh nvim-tree" })
	end,
}
