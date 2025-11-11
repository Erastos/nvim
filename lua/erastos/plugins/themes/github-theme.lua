-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = selected_theme ~= "github-theme",
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
    require("github-theme").setup(opts)
  end,
}
