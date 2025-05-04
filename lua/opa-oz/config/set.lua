local opt = vim.opt

local options = {
    -- Make line numbers default
    nu = true,
    -- You can also add relative line numbers, to help with jumping.
    relativenumber = false,
    tabstop = 4,
    softtabstop = 4,

    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    wrap = false,

    -- Minimal number of screen lines to keep above and below the cursor.
    scrolloff = 12,
    signcolumn = "yes",
    -- Save undo history
    undofile = true,
    -- Enable mouse mode, can be useful for resizing splits for example!
    mouse = "a",

    -- Configure how new splits should be opened
    splitright = true,
    splitbelow = true,

    -- Preview substitutions live, as you type!
    inccommand = "split",

    -- Show which line your cursor is on
    cursorline = true,

    -- HACK: Experimental https://github.com/BreadOnPenguins/nvim/blob/master/lua/config/options.lua
    showmode = false, --not needed due to lualine
    showcmd = false,
    swapfile = false, --swap just gets in the way, usually
    backup = false,

    ttyfast = true, --faster scrolling
    smoothscroll = true,

    foldmethod = "expr",
    foldlevel = 99, --disable folding, lower #s enable
    foldexpr = "nvim_treesitter#foldexpr()",
}

opt.isfname:append("@-@")
for k, v in pairs(options) do
    opt[k] = v
end

vim.diagnostic.config({
    signs = false,
})

-- opt.colorcolumn = "120"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- opt.clipboard = 'unnamedplus'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- opt.clipboard = 'unnamedplus'
