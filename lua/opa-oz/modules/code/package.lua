local conf = require("opa-oz.modules.code.config")

packageadd({
    -- Autoformat
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    tag = "v5.9.0",
    keys = {
        {
            "<C-f>",
            function()
                require("conform").format({ async = false, lsp_fallback = "fallback" })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        notify_on_error = false,
        -- format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
        formatters_by_ft = {
            lua = { "stylua" },
            yaml = { "yamllint" },
            python = { "isort", "black" },
            javascript = { "prettierd", "eslint" },
        },
    },
})

packageadd({
    "folke/which-key.nvim",
    lazy = true,
    event = "VimEnter",
    tag = "v2.1.0",
    config = conf.whichkey,
})

-- HACK: Disabled because I don't like it
-- packageadd({ "github/copilot.vim", tag = "v1.37.0" })

packageadd({
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    tag = "v4.5.0",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = conf.startuptime,
})

packageadd({
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
})
