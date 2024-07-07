local config = {}

function config.nvimtelescope()
    local builtin = require("telescope.builtin")
    local wk = require("which-key")

    local search_dirs = { ".", ".github" }

    wk.register({
        ["<leader>"] = {
            pf = {
                function()
                    builtin.find_files({ search_dirs = search_dirs })
                end,
                "[F]ind files",
                mode = "n",
            },
            ps = {
                function()
                    builtin.live_grep({ search_dirs = search_dirs })
                end,
                "Live [S]earch",
                mode = "n",
            },
            sk = { builtin.keymaps, "[S]earch [K]eymaps" },
            sw = { builtin.grep_string, "[S]earch current [W]ord" },
            -- Slightly advanced example of overriding default behavior and theme
            ["/"] = {
                function()
                    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                    }))
                end,
                "[/] Fuzzily search in current buffer",
            },
            sn = {
                function()
                    builtin.find_files({ cwd = vim.fn.stdpath("config"), search_dirs = search_dirs })
                end,
                "[S]earch [N]eovim files",
            },
        },
        ["<C-p>"] = { builtin.git_files, "Find in Git" },
    })
end

function config.nvimtree()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 50,
        },
        filters = { custom = { "^.git$" } },
        git = { enable = true },
        renderer = {
            highlight_git = true,
            icons = {
                show = {
                    git = true,
                },
            },
        },
    })
end

function config.harpoon()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
    end, { desc = "[A]dd to Harpoon" })
    vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Op[E]n Harpoon" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function()
        harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-N>", function()
        harpoon:list():next()
    end)
end

function config.workspaces()
    local workspaces = require("workspaces")

    workspaces.setup({
        hooks = {
            open = "NvimTreeOpen",
        },
    })

    local uv = vim.loop
    local utils = require("opa-oz.utils")
    local wspc = workspaces.get()
    local path = utils.path_join(vim.fn.stdpath("cache"), "dashboard", "cache")

    local projects = {}
    for _, folder in pairs(wspc or {}) do
        local p = folder.path

        if p:sub(#p, #p) == "/" then
            p = p:sub(1, -2)
        end

        if not vim.tbl_contains(projects, p) then
            table.insert(projects, p)
        end
    end

    table.sort(projects)

    uv.fs_open(path, "r+", 384, function(err, fd)
        assert(not err, err)
        local dump = "return " .. vim.inspect(projects)
        uv.fs_write(fd, dump, 0, function(err, _)
            assert(not err, err)
            uv.fs_ftruncate(fd, #dump, function(err, _)
                assert(not err, err)
                uv.fs_close(fd)
            end)
        end)
    end)
end

function config.dashboard()
    require("dashboard").setup({
        shortcut_type = "number",
        hide = {
            statusline = false, -- hide statusline default is true
            tabline = false, -- hide the tabline
            winbar = false, -- hide winbar
        },
        config = {
            week_header = {
                enable = true,
            },
            mru = {
                limit = 5,
            },
            shortcut = {
                { desc = "[  opa-oz]", group = "DashboardShortCut" },
                { desc = "[  Mason]", group = "DashboardShortCut", action = "Mason", key = "m" },
                { desc = "[  Lazy]", group = "DashboardShortCut", action = "Lazy", key = "l" },
            },
            project = {
                label = "Workspaces",
                action = function(path)
                    local for_search = path .. "/"
                    local workspaces = require("workspaces").get()

                    for _, folder in pairs(workspaces or {}) do
                        if folder.path == for_search then
                            vim.cmd("WorkspacesOpen " .. folder.name)
                            break
                        end
                    end
                end,
            },
        },
    })
end

return config
