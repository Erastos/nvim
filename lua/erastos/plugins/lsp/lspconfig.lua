return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    { "williamboman/mason-lspconfig.nvim", optional = true },
  },
  config = function()
    -- Apply capabilities globally to all servers (blink.cmp extends defaults)
    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    -- Per-server settings (extend nvim-lspconfig base configs)
    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          gofumpt = true,
          usePlaceholders = true,
          analyses = { unusedparams = true },
          staticcheck = true,
        },
      },
    })

    vim.lsp.config("pyright", {
      settings = {
        pyright = { disableOrganizeImports = true },
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    vim.lsp.config("ts_ls", {
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
          },
        },
      },
    })

    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          keyOrdering = false,
          schemaStore = {
            enable = true,
            url = "https://www.schemastore.org/api/json/catalog.json",
          },
          schemas = {
            kubernetes = "*.yaml",
            ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
            ["https://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yml,yaml}",
            ["https://gitlab.com/gitlab-org/gitlab-foss/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml",
            ["https://gitlab.com/gitlab-org/gitlab-foss/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab/**/*.{yml,yaml}",
          },
        },
      },
    })

    -- On NixOS, mason-lspconfig won't run, so enable servers manually
    if vim.g.is_nixos then
      vim.lsp.enable({
        "gopls",
        "pyright",
        "ts_ls",
        "eslint",
        "terraformls",
        "ansiblels",
        "yamlls",
        "rust_analyzer",
      })
    end

    -- LSP keymaps applied on each attach via autocmd (not on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf }
        local map = function(keys, fn, desc)
          vim.keymap.set("n", keys, fn, vim.tbl_extend("force", opts, { desc = desc }))
        end

        -- Note: K, gra, gri, grn, grr, grt are built-in defaults in Neovim 0.12

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("gt", vim.lsp.buf.type_definition, "Go to type definition")

        map("<leader>ld", vim.diagnostic.open_float, "Line diagnostics")
        map("<leader>lR", "<cmd>LspRestart<CR>", "Restart LSP")

        -- vim.diagnostic.jump replaces deprecated goto_prev/goto_next
        map("[d", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")
        map("]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
        map("[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, "Prev error")
        map("]e", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, "Next error")
      end,
    })

    -- Diagnostic display
    vim.diagnostic.config({
      virtual_text = { prefix = "●" },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = true,
      },
    })
  end,
}
