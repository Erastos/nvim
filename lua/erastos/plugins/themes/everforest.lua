-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "sainnhe/everforest",
  lazy = selected_theme ~= "everforest",
  priority = 1000,
  config = function()
    -- Configuration must be set before colorscheme
    vim.g.everforest_background = "medium" -- hard, medium, soft
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_enable_bold = 1
    vim.g.everforest_transparent_background = 0
    vim.g.everforest_better_performance = 1
    vim.g.everforest_diagnostic_text_highlight = 1
    vim.g.everforest_diagnostic_line_highlight = 1
  end,
}
