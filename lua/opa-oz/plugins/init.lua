local mason = require("opa-oz.plugins.mason")

local plugins = {
    -- Lsp setup
    require("opa-oz.plugins.nvim-treesitter"),
    mason.mason,
    mason.tool_installer,
    mason.lspconfig,
    require("opa-oz.plugins.lsp-zero"),
    require("opa-oz.plugins.nvim-lspconfig"),
    require("opa-oz.plugins.nvim-cmp"),
    require("opa-oz.plugins.lua-snip"),

    -- Code
    require("opa-oz.plugins.nvim-conform"),
    require("opa-oz.plugins.which-key"),
    require("opa-oz.plugins.vim-copilot"),
    require("opa-oz.plugins.vim-startuptime"),

    -- Tweaks
    require("opa-oz.plugins.nvim-oil"),
    require("opa-oz.plugins.nvim-comment"),
    require("opa-oz.plugins.nvim-toggleterm"),
    require("opa-oz.plugins.hlsearch"),
    require("opa-oz.plugins.mini"),
    require("opa-oz.plugins.nvim-macros"),

    -- Navigation
    require("opa-oz.plugins.nvim-telescope"),
    require("opa-oz.plugins.nvim-tree"),
    require("opa-oz.plugins.harpoon"),
    require("opa-oz.plugins.workspaces"),
    require("opa-oz.plugins.dashboard"),

    -- UI
    require("opa-oz.plugins.dracula-theme"),
    require("opa-oz.plugins.lualine"),
    require("opa-oz.plugins.undotree"),

    -- Insert UI
    require("opa-oz.plugins.todo-comments"),
    require("opa-oz.plugins.indent-mini"),
    require("opa-oz.plugins.gitsigns"),
}

return plugins
