local theme = vim.g.nvim_theme or "tokyonight"
local is_active = vim.startswith(theme, "gruvbox")

return {
  "sainnhe/gruvbox-material",
  lazy = not is_active,
  priority = 1000,
  config = function()
    local style = theme:match("gruvbox%-material%-(.+)") or "medium"
    vim.g.gruvbox_material_background = style
    vim.g.gruvbox_material_better_performance = 1
    vim.cmd("colorscheme gruvbox-material")
  end,
}
