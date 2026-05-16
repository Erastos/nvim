return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find files" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<CR>", desc = "Recent files" },
    { "<leader>fs", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
    { "<leader>fc", "<cmd>FzfLua grep_cword<CR>", desc = "Grep word under cursor" },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "Help tags" },
    { "<leader>fd", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "Workspace diagnostics" },
    { "<leader>fk", "<cmd>FzfLua keymaps<CR>", desc = "Find keymaps" },
    { "<leader>fg", "<cmd>FzfLua git_commits<CR>", desc = "Git commits" },
  },
  opts = {
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = {
        layout = "horizontal",
        ratio = 0.5,
      },
    },
  },
}
