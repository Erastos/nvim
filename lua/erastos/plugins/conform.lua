return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo", "FormatDisable", "FormatEnable" },
  keys = {
    {
      "<leader>mp",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      go = { "gofumpt" },
      rust = { "rustfmt" },
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
    },
    format_on_save = function(bufnr)
      if vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
  },

  config = function(_, opts)
    require("conform").setup(opts)
    vim.api.nvim_create_user_command("FormatDisable", function()
      vim.b.disable_autoformat = true
      vim.notify("Autoformat disabled for this buffer", vim.log.levels.INFO)
    end, {
      desc = "Disable format-on-save for the current buffer",
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.notify("Autoformat enabled for this buffer", vim.log.levels.INFO)
    end, {
      desc = "Re-enable format-on-save for the current buffer",
    })
  end,
}
