return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
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
            },
        })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
