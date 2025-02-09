M = {
	"folke/edgy.nvim",
	enabled = false,
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	opts = {
		left = {
			{
				title = "Neo-Tree",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "filesystem"
				end,
				size = { width = 0.20 },
			},
			{
				title = "OUTLINE",
				ft = "Outline",
				size = { width = 0.25, height = 0.4 },
			},
			{
				title = "NvimTree",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "buffers"
				end,
				size = { width = 0.20 },
			},
		},
		bottom = {
			{
				title = "nvterm",
				ft = "NvTerm_vsp",
				size = { width = 0.25 },
			},
			{
				title = "Trouble",
				ft = "Trouble",
				size = { height = 0.10 },
			},
		},
		right = {
			{
				title = "sagaOutLine",
				ft = "sagaoutline",
				size = { width = 0.25 },
			},
			{
				title = "Copilot",
				ft = "copilot-chat",
				size = { width = 0.25 },
			},
		},
	},
}

return M
