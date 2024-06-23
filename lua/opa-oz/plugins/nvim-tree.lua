return {
	"nvim-tree/nvim-tree.lua",
	tag = "v1.4.0",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- require("nvim-tree").setup {}
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 50,
			},
			filters = { custom = { "^.git$" } },
			git = { enable = true },
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
				},
			},
		})
	end,
}
