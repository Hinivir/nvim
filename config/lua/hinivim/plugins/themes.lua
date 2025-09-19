return {
	{
		"catppuccin",
		lazy = false,
		priority = 1200,
		after = function()
			require("catppuccin").setup({
				flavour = "auto",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false,
				float = {
					transparent = false,
					solid = false,
				},
				term_colors = true,
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
