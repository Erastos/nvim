-- local selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

return {
  "folke/tokyonight.nvim",
  lazy = selected_theme ~= "tokyonight",
  priority = 1000,
  opts = {
    style = "storm", -- storm, moon, night, day
    transparent = false,
    styles = {
      sidebars = "dark",
      floats = "dark",
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd([[colorscheme tokyonight]])
  end,
}
