-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "rebelot/kanagawa.nvim",
  lazy = selected_theme ~= "kanagawa",
  priority = 1000,
  opts = {
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,
    theme = "wave", -- wave, dragon, lotus
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
  end,
}
