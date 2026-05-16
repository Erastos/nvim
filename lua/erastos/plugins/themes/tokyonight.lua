local theme = vim.g.nvim_theme or "tokyonight"
local is_active = vim.startswith(theme, "tokyonight")

return {
  "folke/tokyonight.nvim",
  lazy = not is_active,
  priority = 1000,
  config = function()
    local style = theme:match("tokyonight%-(.+)") or "storm"
    require("tokyonight").setup({ style = style })
    vim.cmd("colorscheme tokyonight-" .. style)
  end,
}
