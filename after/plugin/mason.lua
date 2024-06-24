local ensure_installed = {
    -- Lua
    "lua_ls",
    "luaformatter",
    "stylua",

    -- Javascript
    "tsserver",
    "eslint",
    "prettierd",
    "jsonls",

    -- Web
    "html",
    "cssls",

    -- Python
    "black",
    "isort",
    "pylsp",

    -- Docker
    "dockerls",
    "helm_ls",

    -- Golang
    "gopls",

    -- Utils
    "markdown-oxide",
    "dotls",
    "bashls",

    -- Terraform
    "terraformls",
    "tflint",

    -- YAML
    "yamlls",
    "yamllint",
    "actionlint",
}

require("mason").setup({
    -- registries = {
    -- 	"file:~/Repos/Forks/mason-registry",
    -- },
})

require("mason-tool-installer").setup({
    ensure_installed = ensure_installed,
    auto_update = true,
    integrations = {
        ["mason-lspconfig"] = true,
    },
})

require("mason-lspconfig").setup({
    -- ensure_installed = ensure_installed,
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
        pylsp = function()
            require("lspconfig").pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            black = { enabled = true },
                            pylint = { enabled = true, executable = "pylint" },
                            pyls_isort = { enabled = true },
                        },
                        flags = {
                            debounce_text_changes = 200,
                        },
                    },
                },
            })
        end,
    },
})
