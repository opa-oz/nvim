local conf = require("opa-oz.modules.navigation.config")

packageadd({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    event = "VeryLazy",
    config = conf.nvimtelescope,
    dependencies = { "nvim-lua/plenary.nvim" },
})

packageadd({
    "nvim-tree/nvim-tree.lua",
    tag = "v1.4.0",
    lazy = false,
    config = conf.nvimtree,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
})

-- NOTE: Testing arrow now
-- packageadd({
--     "ThePrimeagen/harpoon",
--     branch = "harpoon2",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     event = "VeryLazy",
--     config = conf.harpoon,
-- })

packageadd({
    "natecraddock/workspaces.nvim",
    tar = "1.0",
    config = conf.workspaces,
})

packageadd({
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = conf.dashboard,
    dependencies = { "nvim-tree/nvim-web-devicons" },
})

packageadd({
    "otavioschwanck/arrow.nvim",
    config = conf.arrow,
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
})

packageadd({
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
    },
    keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
})
