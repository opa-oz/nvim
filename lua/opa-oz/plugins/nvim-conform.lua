return {
    -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    tag = "v5.9.0",
    keys = {
        {
            "<C-f>",
            function()
                require("conform").format({ async = true, lsp_fallback = "fallback" })
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
}
