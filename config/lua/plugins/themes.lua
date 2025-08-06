return {
  {
    "catppuccin",
    lazy = false,
    priority = 1200,
    after = function ()
      require("catppuccin").setup({
        flavour = "auto",
        background = {
          light = "latte",
          dark = "mocha",
        },
        term_colors = true,
      })
    end,
  }
}
