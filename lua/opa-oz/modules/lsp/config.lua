local config = {}

function config.treesitter()
    local ensure_installed = {
        "bash",
        "cmake",
        "css",
        "csv",
        "dockerfile",
        "dot",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "hcl",
        "helm",
        "html",
        "http",
        "ini",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "nginx",
        "nix",
        "query",
        "python",
        "pug",
        "regex",
        "scss",
        "starlark",
        "sql",
        "terraform",
        "typescript",
        "toml",
        "robots",
        "yaml",
        "xml",
        "caddy",
    }

    require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = ensure_installed,
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = true,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,
        indent = { enable = true },
        highlight = {
            enable = true,
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    })
end

function config.mason()
    require("mason").setup({
        -- registries = {
        -- 	"file:~/Repos/Forks/mason-registry",
        -- },
    })
end

function config.masoninstaller()
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

        -- Ansible
        "ansible-lint",
        "ansiblels",

        -- Golang
        "gopls",

        -- Utils
        "markdown_oxide",
        "dotls",
        "bashls",

        -- Terraform
        "terraformls",
        "tflint",
        "hclfmt",

        -- YAML
        "yamlls",
        "yamllint",
        "actionlint",

        -- Misc
        "nil_ls",
        "rnix",
    }

    require("mason-tool-installer").setup({
        ensure_installed = ensure_installed,
        auto_update = true,
        integrations = {
            ["mason-lspconfig"] = true,
        },
    })
end

function config.masonlspconfig()
    require("mason-lspconfig").setup({
        -- ensure_installed = ensure_installed,
        handlers = {
            function(server_name)
                if server_name == "tsserver" then
                    server_name = "ts_ls"
                end
                require("lspconfig")[server_name].setup({})
            end,
            pylsp = function()
                require("lspconfig").pylsp.setup({
                    settings = {
                        pylsp = { -- https://jdhao.github.io/2023/07/22/neovim-pylsp-setup/
                            plugins = {
                                -- formatter options
                                black = { enabled = true },
                                autopep8 = { enabled = false },
                                yapf = { enabled = false },
                                -- linter options
                                pylint = {
                                    enabled = true,
                                    -- executable = "pylint",
                                }, -- это дермище делает ошибки линтера тупые
                                pyflakes = { enabled = false },
                                pycodestyle = { enabled = false },
                                -- type checker
                                pylsp_mypy = { enabled = true },
                                -- auto-completion options
                                jedi_completion = { fuzzy = true },
                                -- import sorting
                                pyls_isort = { enabled = false },
                                rope_autoimport = {
                                    enabled = false,
                                },
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
end

function config.lspzero()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(event, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
        -- local opts = { buffer = bufnr, remap = true }

        local builtin = require("telescope.builtin")
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
        end

        map("<leader>vrn", function()
            vim.lsp.buf.rename()
        end, "Re[N]ame")
        map("<leader>vrr", function()
            vim.lsp.buf.reference()
        end, "[R]eference")

        -- map('<C-h>', function() vim.lsp.buf.signature_help() end, 'Signature [H]elp')
        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, { buffer = bufnr, desc = "LSP: Signature [H]elp", remap = true })

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")

        -- Find references for the word under your cursor.
        map("gr", builtin.lsp_references, "[G]oto [R]eferences")

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap.
        map("K", vim.lsp.buf.hover, "Hover Documentation")

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        map("<leader>ge", function()
            vim.diagnostic.open_float()
        end, "[G]et [E]rror")

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.id)
        if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                end,
            })
        end
        -- The following autocommand is used to enable inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map("<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, "[T]oggle Inlay [H]ints")
        end
    end)
end

function config.nvimcmp()
    local cmp = require("cmp")
    -- local cmp_action = require("lsp-zero").cmp_action()

    cmp.setup({
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
        },
        mapping = cmp.mapping.preset.insert({
            -- ['<Tab>'] = cmp_action.luasnip_supertab(),
            -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
    })
end

return config
