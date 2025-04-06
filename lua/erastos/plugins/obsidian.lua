return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Dropbox/Documents/Notes",
			},
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
	},
}
