-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "sainnhe/gruvbox-material",
  lazy = selected_theme ~= "gruvbox-material",
  priority = 1000,
  config = function()
    -- Configuration must be set before colorscheme
    vim.g.gruvbox_material_background = "medium" -- hard, medium, soft
    vim.g.gruvbox_material_foreground = "material" -- material, mix, original
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_transparent_background = 0
    vim.g.gruvbox_material_better_performance = 1
  end,
}
