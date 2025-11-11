-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "navarasu/onedark.nvim",
  lazy = selected_theme ~= "onedark",
  priority = 1000,
  opts = {
    style = "dark", -- dark, darker, cool, deep, warm, warmer
    transparent = false,
    term_colors = true,
    code_style = {
      comments = "italic",
      keywords = "bold",
      functions = "none",
      strings = "none",
      variables = "none"
    },
  },
  config = function(_, opts)
    require("onedark").setup(opts)
    require("onedark").load()
  end,
}
