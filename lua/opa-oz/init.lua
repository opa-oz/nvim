require("opa-oz.install-lazy")
require("opa-oz.config.set")
require("opa-oz.config.remap")
require("opa-oz.config.terminal")

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

require("workspaces").setup({
    hooks = {
        open = "NvimTreeOpen",
    },
})

require("opa-oz.config.sync-workspaces")

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

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.robots = {
--     install_info = {
--         url = "https://github.com/opa-oz/tree-sitter-robots-txt", -- local path or git repo
--         files = { "src/parser.c", "src/scanner.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
--         branch = "main",
--     },
--     -- filetype = "terraform-vars", -- if filetype does not match the parser name
-- }
-- vim.treesitter.language.register("tfvars", { "terraform-vars" })
