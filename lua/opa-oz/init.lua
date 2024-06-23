require("opa-oz.install-lazy")
require("opa-oz.set")
require("opa-oz.remap")
require("opa-oz.terminal")

-- init plugins
local plugins = require("opa-oz.plugins")

require("lazy").setup(plugins)
require("ibl").setup()
require("Comment").setup()
require("lualine").setup({
	options = { theme = "dracula" },
})

-- init hooks
require("opa-oz.hooks")

-- init autocommands
require("opa-oz.autocommands")

-- vim.api.nvim_create_autocmd('BufReadPost', {
--     pattern = "*",
--     callback = function(event)
--         -- Test self-written plugins
--         vim.lsp.start({
--             bufnr = event.bufnr,
--             name = "emoji-lsp",
--             -- filetypes = { 'lua', 'json' },
--             cmd = { "/Users/vladimirlevin/Repos/Goland/emoji-lsp/bin/emoji-lsp" },
--             root_dir = vim.fn.getcwd(),
--             -- root_dir = '/Users/vladimirlevin/.config/nvim',
--         })
--     end,
-- })

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*.pug",
	callback = function(event)
		-- Test self-written plugins
		vim.lsp.start({
			bufnr = event.bufnr,
			name = "pug-lsp",
			-- filetypes = { 'lua', 'json' },
			cmd = { "/Users/vladimirlevin/Repos/Goland/pug-lsp/pug-lsp" },
			root_dir = vim.fn.getcwd(),
			-- root_dir = '/Users/vladimirlevin/.config/nvim',
		})
	end,
})
