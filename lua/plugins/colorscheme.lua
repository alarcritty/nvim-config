return {
	-- Disable tokyonight
	{
		"folke/tokyonight.nvim",
		enabled = false,
	},

	-- rose-pine (ThePrimeagen's colorscheme)
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "main",
			dark_variant = "main",
			disable_background = true,
			disable_float_background = true,
			disable_italics = false,
			styles = {
				italic = true,
				transparency = true,
			},
		},
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine",
		},
	},
}
