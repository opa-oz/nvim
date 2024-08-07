local config = {}

function config.whichkey()
    local wk = require("which-key")

    wk.register({
        ["<leader>"] = {
            y = { '"+y', "Cop[y] to system clipboard", noremap = true, mode = "n" },
            Y = { '"+Y', "Cop[Y] to system clipboard", noremap = true, mode = "n" },
        },
        ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
        ["<leader>p"] = { name = "[P]roject", _ = "which_key_ignore" },
        ["<leader>v"] = { name = "[V]im", _ = "which_key_ignore" },
        ["<leader>vr"] = { name = "[R]efactor", _ = "which_key_ignore" },
        ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
        ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
        ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
        ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
        ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
        ["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
        ["<leader>u"] = { name = "[U]ndo tree", _ = "which_key_ignore" },
        ["<C-t>"] = { ":NvimTreeToggle<cr>", "Open [T]ree", silent = true, noremap = true },
        ["<C-s>"] = { ":w<cr>", "[S]ave File" },
        J = { ":m '>+1<CR>gv=gv", "Move Down", mode = "v" },
        K = { ":m '>-2<CR>gv=gv", "Move Up", mode = "v" },
        -- K = { "ddkP", "Move Up", mode = "v" },
        ["sa"] = { name = "[S]urround [A]dd", _ = "which_key_ignore" },
        ["sd"] = { name = "[S]urround [D]elete", _ = "which_key_ignore" },
        ["sf"] = { name = "[S]urround [F]ind right", _ = "which_key_ignore" },
        ["sF"] = { name = "[S]urround [F]ind left", _ = "which_key_ignore" },
        ["sh"] = { name = "[S]urround [H]ighlight", _ = "which_key_ignore" },
        ["sr"] = { name = "[S]urround [R]eplace", _ = "which_key_ignore" },
    })
end

function config.startuptime()
    vim.g.startuptime_tries = 10
end

return config
