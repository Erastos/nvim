local theme = vim.g.nvim_theme or "tokyonight"
local is_active = vim.startswith(theme, "catppuccin")

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = not is_active,
  priority = 1000,
  config = function()
    local flavour = theme:match("catppuccin%-(.+)") or "mocha"
    require("catppuccin").setup({ flavour = flavour })
    vim.cmd("colorscheme catppuccin-" .. flavour)
  end,
}
