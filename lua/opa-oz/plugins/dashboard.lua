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
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
