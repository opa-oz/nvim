local config = {}

function config.dracula()
    vim.cmd.colorscheme("dracula")
end

function config.lualine()
    local statusline = require("arrow.statusline")
    local function arrow_status()
        return statusline.text_for_statusline_with_icons()
    end
    local custom_dracula = require("lualine.themes.dracula")

    require("lualine").setup({
        options = { theme = custom_dracula },
        sections = {
            lualine_b = { "branch", "diff", "diagnostics", arrow_status },
        },
    })
end

function config.indentmini()
    require("indentmini").setup() -- use default config
end

function config.gitsigns()
    require("gitsigns").setup()
end

function config.undotree()
    local undotree = require("undotree")

    undotree.setup({
        float_diff = true, -- using float window previews diff, set this `true` will disable layout option
        layout = "left_bottom", -- "left_bottom", "left_left_bottom"
        position = "right", -- "right", "bottom"
        ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
        window = {
            winblend = 30,
        },
        keymaps = {
            ["j"] = "move_next",
            ["k"] = "move_prev",
            ["gj"] = "move2parent",
            ["J"] = "move_change_next",
            ["K"] = "move_change_prev",
            ["<cr>"] = "action_enter",
            ["p"] = "enter_diffbuf",
            ["q"] = "quit",
        },
    })
end

function config.todocomments()
    require("todo-comments").setup()
end

return config
