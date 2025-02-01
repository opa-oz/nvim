local conf = require("opa-oz.modules.lsp.config")

-- return { "opa-oz/nvim-treesitter", branch = "feat-robots", build = ":TSUpdate" }
packageadd({
    "opa-oz/nvim-treesitter",
    -- "nvim-treesitter/nvim-treesitter",
    branch = "feat/caddy",
    build = ":TSUpdate",
    config = conf.treesitter,
})

packageadd({
    "neovim/nvim-lspconfig",
    priority = 1000,
    dependencies = { { "folke/neodev.nvim", opts = {} } },
})

packageadd({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    commit = "16de3b18c5f7b6230d89b8e64ce9a4801b6f8d08",
    config = conf.lspzero,
})

packageadd({
    "williamboman/mason.nvim",
    event = "VeryLazy",
    tag = "v1.10.0",
    config = conf.mason,
})

packageadd({
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    commit = "b129892f783740e6cf741f2ea09fa5dd512aa584",
    config = conf.masoninstaller,
})

packageadd({
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    tag = "v1.29.0",
    config = conf.masonlspconfig,
})

packageadd({
    -- if put any even in here - it stops working
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    commit = "5260e5e8ecadaf13e6b82cf867a909f54e15fd07",
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp", commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d" },
    },
    config = conf.nvimcmp,
})

packageadd({
    "L3MON4D3/LuaSnip",
    tag = "v2.3.0",
    build = "make install_jsregexp",
})
