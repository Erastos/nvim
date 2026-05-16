return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- Minimal setup (parser manager only; highlighting is built into Neovim 0.12)
    require("nvim-treesitter").setup()

    -- Install any missing parsers from the wanted list
    local wanted = {
      "bash", "css", "go", "gomod", "gosum", "hcl", "html",
      "javascript", "json", "jsonc", "lua", "markdown",
      "markdown_inline", "python", "regex", "rust", "terraform",
      "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
    }
    local installed = require("nvim-treesitter.config").get_installed("parsers")
    local installed_set = {}
    for _, p in ipairs(installed) do installed_set[p] = true end
    local missing = vim.tbl_filter(function(p) return not installed_set[p] end, wanted)
    if #missing > 0 then
      require("nvim-treesitter.install").install(missing)
    end

    -- Auto-close/rename HTML and JSX tags
    require("nvim-ts-autotag").setup()

    -- Textobject behaviour options (keymaps set below)
    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
      move = { set_jumps = true },
    })

    -- Textobject select keymaps (x = visual, o = operator-pending)
    local sel = require("nvim-treesitter-textobjects.select")
    local captures = {
      af = "@function.outer",
      ["if"] = "@function.inner",
      ac = "@class.outer",
      ic = "@class.inner",
      aa = "@parameter.outer",
      ia = "@parameter.inner",
    }
    for key, query in pairs(captures) do
      vim.keymap.set({ "x", "o" }, key, function()
        sel.select_textobject(query, "textobjects")
      end)
    end

    -- Textobject move keymaps
    local mov = require("nvim-treesitter-textobjects.move")
    vim.keymap.set("n", "]f", function() mov.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function start" })
    vim.keymap.set("n", "[f", function() mov.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev function start" })
    vim.keymap.set("n", "]c", function() mov.goto_next_start("@class.outer", "textobjects") end, { desc = "Next class start" })
    vim.keymap.set("n", "[c", function() mov.goto_previous_start("@class.outer", "textobjects") end, { desc = "Prev class start" })
  end,
}
