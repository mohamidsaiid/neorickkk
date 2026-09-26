return {
	"binhtran432k/dracula.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Option names are specific to binhtran432k/dracula.nvim (not tokyonight-style).
		-- transparent_bg lets Ghostty's Dracula background (and its opacity/blur) show
		-- through, so Neovim, herdr and the terminal share one background.
		require("dracula").setup({
			transparent_bg = true,
			overrides = function(colors)
				return {
					DiagnosticHint = { fg = colors.orange },
					DiagnosticError = { fg = "#ff0000" },
					NormalFloat = { bg = "NONE" },
					FloatBorder = { fg = colors.purple, bg = "NONE" },
				}
			end,
		})
		vim.cmd.colorscheme("dracula")
	end,
}
