require("opa-oz.install-lazy")
require("opa-oz.set")
require("opa-oz.remap")
require("opa-oz.terminal")

-- init plugins
local plugins = require("opa-oz.plugins")

require("lazy").setup(plugins)
require("Comment").setup()
require("gitsigns").setup()
require("lualine").setup({
    options = { theme = "dracula" },
})

-- init hooks
require("opa-oz.hooks")

-- init autocommands
require("opa-oz.autocommands")

-- require("lspconfig").pug.setup({})

-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 	pattern = "*.pug",
-- 	callback = function(event)
-- 		-- Test self-written plugins
-- 		vim.lsp.start({
-- 			bufnr = event.bufnr,
-- 			name = "pug-lsp",
-- 			-- filetypes = { 'lua', 'json' },
-- 			cmd = { "/Users/vladimirlevin/Repos/Goland/pug-lsp/pug-lsp" },
-- 			root_dir = vim.fn.getcwd(),
-- 			-- root_dir = '/Users/vladimirlevin/.config/nvim',
-- 		})
-- 	end,
-- })
