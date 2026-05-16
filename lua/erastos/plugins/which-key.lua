return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>b", group = "buffer" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>h", group = "harpoon" },
      { "<leader>l", group = "lsp" },
      { "<leader>m", group = "format" },
      { "<leader>t", group = "tab" },
      { "<leader>w", group = "window" },
      { "<leader>x", group = "diagnostics" },
    },
  },
}
