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
})
