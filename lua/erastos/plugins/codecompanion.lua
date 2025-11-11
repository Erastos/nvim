return {
  "olimorris/codecompanion.nvim",
  opts = {
    opts = {
      log_level = "DEBUG",
    },
    strategies = {
      chat = {
        adapter = "anthropic",
        model = "claude-sonnet-4-20250514",
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
