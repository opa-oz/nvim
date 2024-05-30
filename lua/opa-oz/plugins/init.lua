local plugins = {
    require("opa-oz.plugins.dracula-theme"),

    require("opa-oz.plugins.nvim-telescope"),
    require("opa-oz.plugins.nvim-comment"),
    require("opa-oz.plugins.nvim-treesitter"),

    -- lsp setup
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    require("opa-oz.plugins.lsp-zero"),
    require("opa-oz.plugins.nvim-lspconfig"),
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },

    require("opa-oz.plugins.which-key"),
    require("opa-oz.plugins.nvim-tree"),
    require("opa-oz.plugins.indent-blankline"),
    require("opa-oz.plugins.nvim-conform"),
    require("opa-oz.plugins.mini"),
    require("opa-oz.plugins.lualine"),
    require("opa-oz.plugins.nvim-oil"),
    require("opa-oz.plugins.nvim-toggleterm"),
    require("opa-oz.plugins.undotree"),
}

return plugins
