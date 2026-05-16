return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = { char = "│" },
    scope = { enabled = true },
    exclude = {
      filetypes = {
        "help", "dashboard", "lazy", "mason", "oil",
        "trouble", "toggleterm", "TelescopePrompt",
      },
    },
  },
}
