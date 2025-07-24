return {
  "allaman/emoji.nvim",
  opts = {
    enable_cmp_integration = true,
  },
  config = function(_, opts)
    require("emoji").setup(opts)

    local ts = require('telescope').load_extension 'emoji'
    vim.keymap.set('n', '<leader>fe', ts.emoji, { desc = 'Find Emoji'})
  end,
}
