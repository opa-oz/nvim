local builtin = require("telescope.builtin")
local wk = require("which-key")

wk.register({
    ["<leader>"] = {
        pf = { builtin.find_files, "[F]ind files", mode = "n" },
        ps = { builtin.live_grep, "Live [S]earch", mode = "n" },
        sk = { builtin.keymaps, "[S] earch [K]eymaps" },
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
                builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end,
            "[S]earch [N]eovim files",
        },
    },
    ["<C-p>"] = { builtin.git_files, "Find in Git" },
})
