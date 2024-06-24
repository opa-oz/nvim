return {
    "nvimdev/indentmini.nvim",
    event = "BufRead",
    config = function()
        require("indentmini").setup() -- use default config
    end,
}
