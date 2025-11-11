-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "shaunsingh/nord.nvim",
  lazy = selected_theme ~= "nord",
  priority = 1000,
  config = function()
    -- Configuration must be set before colorscheme
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = false
    vim.g.nord_italic = true
    vim.g.nord_bold = true
  end,
}
