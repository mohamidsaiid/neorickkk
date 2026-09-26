return {
	"binhtran432k/dracula.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("dracula").setup({
			transparent = true,
			style = "default",
			styles = {
				functions = {},
				sidebars = "transparent",
				floats = "transparent",
			},
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = "#ff0000"
			end,
		})
		vim.cmd.colorscheme("dracula")
	end,
}
