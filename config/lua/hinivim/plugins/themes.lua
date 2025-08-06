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
				term_colors = true,
				integrations = {
					alpha = true,
					treesitter = true,
					treesitter_context = false,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
					},
					telescope = {
						enabled = true,
					},
					cmp = false,
					blink_cmp = true,
					lsp_trouble = true,
					nvimtree = true,
					which_key = false,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = true,
					},
					gitsigns = true,
					markdown = true,
					render_markdown = false,
					harpoon = true,
					symbols_outline = true,
					ts_rainbow = true,
					notify = true,
				},
			})

      print("hello")
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
