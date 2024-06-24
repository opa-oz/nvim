vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local key = vim.keymap

key.set("n", "<leader>y", '"+y')
key.set("v", "<leader>y", '"+y')
key.set("n", "<leader>Y", '"+Y')

-- replacement of Esc
key.set("i", "<C-c>", "<Esc>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
key.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
key.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
key.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
key.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

key.set("n", "<leader>ts", ":ToggleTerm<cr>", { desc = "Open [T]erminal" })
key.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
