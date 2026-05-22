vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.is_nixos = vim.fn.filereadable("/etc/NIXOS") == 1
vim.g.nvim_theme = os.getenv("NVIM_THEME") or "tokyonight"

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wildmenu = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Editing
opt.backspace = "indent,eol,start"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.shada = "!,'200,<50,s10,h"

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300
