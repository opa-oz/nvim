local M = {}

M.mason = { "williamboman/mason.nvim", tag = "v1.10.0" }

M.tool_installer = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    commit = "b129892f783740e6cf741f2ea09fa5dd512aa584",
}

M.lspconfig = { "williamboman/mason-lspconfig.nvim", tag = "v1.29.0" }

return M
