function apply_colors(color)
    color = color or "dracula"

    vim.cmd.colorscheme(color)

    -- Colors are applied automatically based on user-defined highlight groups.
    -- There is no default value.
    vim.cmd.highlight("IndentLine guifg=#424450")
    -- Current indent line highlight
    vim.cmd.highlight("IndentLineCurrent guifg=#424450")
end

apply_colors()
