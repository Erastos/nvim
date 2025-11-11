-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "Mofiqul/dracula.nvim",
  lazy = selected_theme ~= "dracula",
  priority = 1000,
  opts = {
    transparent_bg = false,
    italic_comment = true,
    show_end_of_buffer = true,
    colors = {},
    overrides = {},
  },
  config = function(_, opts)
    require("dracula").setup(opts)
  end,
}
