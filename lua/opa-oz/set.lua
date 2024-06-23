local opt = vim.opt
-- Make line numbers default
opt.nu = true
-- You can also add relative line numbers, to help with jumping.
-- opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4

opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 12
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- opt.colorcolumn = "120"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- opt.clipboard = 'unnamedplus'

-- Save undo history
opt.undofile = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- opt.clipboard = 'unnamedplus'

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- Show which line your cursor is on
opt.cursorline = true
