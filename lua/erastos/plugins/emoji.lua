return {
  "allaman/emoji.nvim",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  cmd = { "InsertEmoji", "InsertEmojiByGroup" },
  keys = {
    {"<leader>fe", "<cmd>InsertEmoji<CR>", desc = "Find Emoji"},
    {"<leader>fE", "<cmd>InsertEmojiByGroup<CR>", desc = "Find Emoji by Group"},
  },
}
