-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "EdenEast/nightfox.nvim",
  lazy = selected_theme ~= "nightfox",
  priority = 1000,
  opts = {
    options = {
      transparent = false,
      terminal_colors = true,
      dim_inactive = false,
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      },
    },
  },
  config = function(_, opts)
    require("nightfox").setup(opts)
  end,
}
