vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.wildmenu = true

-- Global Variable that determines which theme to load at startup
selected_theme = os.getenv("NVIM_THEME") or "tokyonight"

-- Filetypes
vim.filetype.add({
	extension = {
		yml = "yaml.ansible",
	},
})
