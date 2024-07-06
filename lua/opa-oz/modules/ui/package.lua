local conf = require("opa-oz.modules.ui.config")

packageadd({
    "Mofiqul/dracula.nvim",
    commit = "8d8bddb8814c3e7e62d80dda65a9876f97eb699c",
    priority = 1000,
    init = conf.dracula,
})

packageadd({
    "nvim-lualine/lualine.nvim",
    event = "BufEnter */*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    commit = "0a5a66803c7407767b799067986b4dc3036e1983",
    config = conf.lualine,
})

packageadd({
    "nvimdev/indentmini.nvim",
    event = "BufRead",
    config = conf.indentmini,
})

packageadd({
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    tag = "v0.9.0",
    config = conf.gitsigns,
})

packageadd({
    "jiaoshijie/undotree",
    commit = "eab459ab87dd249617b5f7187bb69e614a083047",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = conf.undotree,
    keys = { -- load the plugin only when using it's keybinding:
        { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
})

packageadd({
    "folke/todo-comments.nvim",
    event = "BufEnter */*",
    dependencies = { "nvim-lua/plenary.nvim" },
    tag = "v1.2.0",
    config = conf.todocomments,
    opts = {
        -- TODO: fix config
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
})

packageadd({
    "nvim-tree/nvim-web-devicons",
    lazy = true,
})
