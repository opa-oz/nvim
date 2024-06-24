-- return {
-- 	"opa-oz/nvim-tree.lua",
-- 	branch = "2598-resize-api",
-- 	lazy = false,
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	config = function()
-- 		require("nvim-tree").setup({
-- 			sort = {
-- 				sorter = "case_sensitive",
-- 			},
-- 			filters = { custom = { "^.git$" } },
-- 			git = { enable = true },
-- 			renderer = {
-- 				highlight_git = true,
-- 				icons = {
-- 					show = {
-- 						git = true,
-- 					},
-- 				},
-- 			},
-- 		})
-- 		local resize = require("nvim-tree.api").tree.resize
-- 		local function use_nvim_tree_width(options)
-- 			if type(options) ~= "table" then
-- 				return
-- 			end
--
-- 			---@type number
-- 			local offset = options.offset
--
-- 			if type(offset) ~= "number" then
-- 				offset = 10
-- 			end
--
-- 			---@type number|table
-- 			local width = 30
--
-- 			local function get_width()
-- 				return width
-- 			end
--
-- 			local function increment_width()
-- 				resize({ relative = offset })
-- 			end
--
-- 			local function decrement_width()
-- 				resize({ relative = -offset })
-- 			end
--
-- 			local function dynamic_width()
-- 				width = {}
-- 				resize({ width = width })
-- 			end
--
-- 			return get_width, increment_width, decrement_width, dynamic_width
-- 		end
--
-- 		local get_width, increment_width, decrement_width, dynamic_width = use_nvim_tree_width({
-- 			offset = 10,
-- 		})
--
-- 		local wk = require("which-key")
--
-- 		wk.register({
-- 			["<leader>n"] = {
-- 				name = "NvimTree",
-- 				w = {
-- 					name = "NvimTree Width",
-- 					i = {
-- 						increment_width,
-- 						"Increment NvimTree Width",
-- 					},
-- 					d = {
-- 						decrement_width,
-- 						"Increment NvimTree Width",
-- 					},
-- 					a = {
-- 						dynamic_width,
-- 						"Automatic NvimTree Width",
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,

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
