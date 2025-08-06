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
				term_colors = false,
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
				},
				default_integrations = true,
				auto_integrations = false,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
