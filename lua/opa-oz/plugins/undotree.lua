return {
    "jiaoshijie/undotree",
    commit = "eab459ab87dd249617b5f7187bb69e614a083047",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
        { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
}
