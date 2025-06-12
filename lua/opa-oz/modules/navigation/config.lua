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

function config.arrow()
    require("arrow").setup({
        show_icons = true,
        leader_key = ";", -- Recommended to be a single key
        -- buffer_leader_key = "m", -- Per Buffer Mappings
    })
end

function config.workspaces()
    local workspaces = require("workspaces")
    local telescope = require("telescope")

    telescope.load_extension("workspaces")

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
                cwd_only = true,
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
            footer = function()
                -- local cmd = ":!curl -s -m 3 'https://wttr.in/{Tokyo,Saratov}?format=3'"
                -- local status, weather = pcall(vim.api.nvim_exec2, cmd, { output = true })
                local status = false -- Hardcoded for speed, no because not working

                if not status then
                    return { "", "🦁 24/7 lion" }
                end

                -- local result = vim.split(weather.output, "\n")
                -- local footer = { "" }
                --
                -- for _, part in pairs(result) do
                --     local trimmed = vim.trim(part)
                --     if #trimmed ~= 0 and #trimmed < #cmd then
                --         footer[#footer + 1] = part
                --     end
                -- end
                --
                -- return footer
            end,
        },
    })
end

return config
