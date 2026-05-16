local theme = vim.g.nvim_theme or "tokyonight"
local is_active = vim.startswith(theme, "rose-pine")

return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = not is_active,
  priority = 1000,
  config = function()
    local variant = theme:match("rose%-pine%-(.+)") or "main"
    require("rose-pine").setup({ variant = variant })
    vim.cmd("colorscheme rose-pine-" .. variant)
  end,
}
