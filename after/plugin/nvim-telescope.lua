local builtin = require("telescope.builtin")
local wk = require("which-key")

wk.register({
    ["<leader>"] = {
        pf = { builtin.find_files, "Find files", mode = "n" },
        ps = {
            function()
                -- BurntSushi/ripgrep is required for live_grep and grep_string and is the first priority for find_files.
                builtin.live_grep()
                -- builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end,
            "Find in files",
            mode = "n",
        },
        sk = { builtin.keymaps, "Search Keymaps" },
        sw = { builtin.grep_string, "Search current Word" },
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
            "Search Neovim files",
        },
    },
    ["<C-p>"] = { builtin.git_files, "Find in Git" },
})
