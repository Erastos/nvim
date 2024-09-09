vim.g.mapleader = " "

local keymap = vim.keymap

-- no highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear search highlights"})

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Split vertically"})
keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Split horiztonally"})
keymap.set("n", "<leader>se", "<C-w>=", {desc = "Make splits Equal"})
keymap.set("n", "<leader>sc", "<CMD>close<CR>", {desc = "Close split"})

-- tabs
keymap.set("n", "<leader>to", "<CMD>tabnew<CR>", {desc = "Open new tab"})
keymap.set("n", "<leader>tc", "<CMD>tabclose<CR>", {desc = "Close new tab"})
keymap.set("n", "<leader>tn", "<CMD>tabn<CR>", {desc = "Go to next tab"})
keymap.set("n", "<leader>tp", "<CMD>tabp<CR>", {desc = "Go to previous tab"})
keymap.set("n", "<leader>tf", "<CMD>tabnew %<CR>", {desc = "Open current buffer in new tab"})
keymap.set("n", "<leader>tC", "<CMD>tabonly<CR>", {desc = "Close other tabs besides current buffer"})
