return {
   "folke/which-key.nvim",
   event = "VeryLazy",
   init = function()
     vim.o.timeout = true
     vim.o.timeoutlen = 500
   end,
   opts = {
     spec = {
       { "<leader>f", group = "🔭 Find" },
       { "<leader>e", group = "🔍 Explorer" },
       { "<leader>w", group = "🪟 Window" },
       { "<leader>t", group = "🗂️ Tabs" },
       { "<leader>b", group = "📝 Buffers" },
       { "<leader>h", group = "🔀 Git" },
       { "<leader>x", group = "⚠️ Diagnostics" },
       { "<leader>c", group = "💡 Code" },
       { "<leader>m", group = "✨ Extras" },
       { "<leader>l", group = "🧹 Lint" },
       { "<leader>s", group = "🔲 Split" },
     },
   }
}
