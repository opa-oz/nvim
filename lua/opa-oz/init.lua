require("opa-oz.install-lazy")
require("opa-oz.set")
require("opa-oz.remap")
require("opa-oz.terminal")

-- init plugins
local plugins = require("opa-oz.plugins")

require("lazy").setup(plugins)
require("ibl").setup()
require("Comment").setup()
require('lualine').setup({
    options = { theme = 'dracula' }
})

-- init hooks
require("opa-oz.hooks")

-- init autocommands
require("opa-oz.autocommands")
