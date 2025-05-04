local conf = require("opa-oz.modules.tweaks.config")

packageadd({
    "stevearc/oil.nvim",
    tag = "v2.10.0",
    event = "VeryLazy",
    opts = { default_file_explorer = false },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
})

packageadd({
    "numToStr/Comment.nvim",
    commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb",
    event = "VeryLazy",
    config = conf.comment,
    opts = {},
})

packageadd({
    "akinsho/toggleterm.nvim",
    tag = "v2.11.0",
    cmd = "ToggleTerm",
    opts = {
        direction = "horizontal",
    },
})

packageadd({
    "nvimdev/hlsearch.nvim",
    event = "BufRead",
    config = conf.hlsearch,
})

packageadd({
    -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    tag = "v0.13.0",
    event = "VeryLazy",
    config = conf.mini,
})

packageadd({
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
})

packageadd({
    "kr40/nvim-macros",
    event = "VeryLazy",
    tag = "v0.3.5",
    config = conf.macros,
    cmd = { "MacroSave", "MacroYank", "MacroSelect", "MacroDelete" },
})
