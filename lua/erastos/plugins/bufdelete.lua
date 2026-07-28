return {
  "famiu/bufdelete.nvim",
  lazy = false,
  config = function() 
    vim.api.nvim_create_user_command("BdeleteRight", function()
      local current = vim.fn.bufnr("%")
      local bufs_right = vim.tbl_map(function(b)
        return b.bufnr
      end, vim.tbl_filter(function(b)
        return b.bufnr > current and vim.fn.getbufvar(b.bufnr, "&buftype") == ""
      end, vim.fn.getbufinfo({ buflisted = 1, bufloaded = 1 })))
      require('bufdelete').bufdelete(bufs_right)
    end, {
      desc = "Delete Buffers to the Right of the Current Buffer",
    })
  end,

  keys = {
    { "<leader>bd", "<cmd>Bdelete<CR>", desc = "Delete buffer (keep split)" },
    { "<leader>bDr", "<cmd>BdeleteRight<CR>", desc = "Delete buffers to the right (keep split)" },
  },
}
