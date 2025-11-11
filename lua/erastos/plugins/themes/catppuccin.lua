-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = selected_theme ~= "catappuccin",
  priority = 1000,
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = false,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      telescope = true,
      which_key = true,
      mason = true,
      markdown = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
  end,
}
