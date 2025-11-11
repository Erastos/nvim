-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = selected_theme ~= "rose-pine",
  priority = 1000,
  opts = {
    variant = "main", -- main, moon, dawn
    dark_variant = "main",
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
  end,
}
