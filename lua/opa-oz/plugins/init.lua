local plugins = {
	require("opa-oz.plugins.dracula-theme"),

	require("opa-oz.plugins.nvim-telescope"),
	require("opa-oz.plugins.nvim-comment"),
	require("opa-oz.plugins.nvim-treesitter"),

	-- lsp setup
	{ "williamboman/mason.nvim", tag = "v1.10.0" },
	{ "williamboman/mason-lspconfig.nvim", tag = "v1.29.0" },
	require("opa-oz.plugins.lsp-zero"),
	require("opa-oz.plugins.nvim-lspconfig"),
	require("opa-oz.plugins.nvim-cmp"),
	-- { "L3MON4D3/LuaSnip", tag = "v2.3.0", build = "make install_jsregexp" },

	require("opa-oz.plugins.which-key"),
	require("opa-oz.plugins.nvim-tree"),
	require("opa-oz.plugins.indent-blankline"),
	require("opa-oz.plugins.nvim-conform"),
	require("opa-oz.plugins.mini"),
	require("opa-oz.plugins.lualine"),
	require("opa-oz.plugins.nvim-oil"),
	require("opa-oz.plugins.nvim-toggleterm"),
	require("opa-oz.plugins.undotree"),
	require("opa-oz.plugins.harpoon"),

	{ "github/copilot.vim", tag = "v1.37.0" },
	require("opa-oz.plugins.startup-time"),
}

return plugins
