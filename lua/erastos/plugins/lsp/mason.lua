return {
  {
    "williamboman/mason.nvim",
    cond = not vim.g.is_nixos,
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cond = not vim.g.is_nixos,
    lazy = true,
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "gopls",
        "pyright",
        "ts_ls",
        "eslint",
        "terraformls",
        "ansiblels",
        "yamlls",
        "rust_analyzer",
      },
      automatic_enable = true,
    },
  },
}
