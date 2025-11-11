return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- Detect if running on NixOS
		local is_nixos = vim.fn.filereadable("/etc/NIXOS") == 1

		-- On NixOS, LSP servers are installed via Nix packages
		-- On other systems (macOS), use Mason to install them
		local lsp_servers = is_nixos and {} or {
			"lua_ls",
			"ansiblels",
			"terraformls",
			"pyright",
			"yamlls",
			"gopls",
			"ts_ls",
		}

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = lsp_servers,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"isort", -- python formatter
				"black", -- python formatter
				"ansible-lint",
				"tflint",
			},
		})
	end,
}
