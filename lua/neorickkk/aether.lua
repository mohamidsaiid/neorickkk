-- Colorscheme driven by the exact palette in ~/.config/ghostty/config, so
-- Neovim, Ghostty and herdr (theme "terminal") all share one look.
-- Keep the hex values here in sync with that file if it changes.
return {
	"omacom-io/aether.nvim",
	branch = "v3",
	name = "aether",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true, -- let Ghostty's background/opacity/blur through
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
		colors = {
			-- Ghostty: background / foreground / palette 7 / palette 15 / palette 8
			bg = "#110b18",
			dark_bg = "#0c0811",
			darker_bg = "#07050b",
			lighter_bg = "#1c1426",

			fg = "#dad3ff",
			dark_fg = "#9c92bf",
			light_fg = "#e1dcff",
			bright_fg = "#ffffff",
			muted = "#65576b",

			-- Ghostty palette 1-6
			red = "#ff3650",
			green = "#beeaa2",
			yellow = "#ffea34",
			blue = "#8168e2",
			purple = "#f053db",
			cyan = "#85c8c6",
			orange = "#ffa64d",
			brown = "#8a6a4a",

			-- Ghostty palette 9-14
			bright_red = "#ff7a87",
			bright_green = "#d9ffc7",
			bright_yellow = "#fff190",
			bright_blue = "#a49aff",
			bright_purple = "#f09dff",
			bright_cyan = "#a8f1ef",

			accent = "#8168e2",
			cursor = "#dad3ff",
			foreground = "#dad3ff",
			background = "#110b18",
			selection = "#3b2d60",
			selection_foreground = "#f0ebff",
			selection_background = "#3b2d60",
		},
		on_colors = function(colors)
			colors.hint = colors.orange
			colors.error = "#ff0000"
		end,
	},
	config = function(_, opts)
		require("aether").setup(opts)
		vim.cmd.colorscheme("aether")
	end,
}
