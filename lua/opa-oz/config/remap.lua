local key, g = vim.keymap, vim.g

g.mapleader = " "
g.maplocalleader = "\\"

local map = function(keys, func, desc)
    key.set("n", keys, func, { desc = desc })
end

key.set("n", "<leader>y", '"+y')
key.set("v", "<leader>y", '"+y')
key.set("n", "<leader>Y", '"+Y')

-- replacement of Esc
key.set("i", "<C-c>", "<Esc>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map("<C-h>", "<C-w><C-h>", "Move focus to the left window")
map("<C-l>", "<C-w><C-l>", "Move focus to the right window")
map("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
map("<C-k>", "<C-w><C-k>", "Move focus to the upper window")
map("<leader>ts", ":ToggleTerm<cr>", "Open [T]erminal")
