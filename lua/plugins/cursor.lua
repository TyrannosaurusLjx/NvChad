local M = {
	----提供光标所在行的高亮, 和单词高亮
	{
		"ya2s/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup({
				cursorline = {
					enable = true,
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = { underline = true },
				},
			})
		end,
	},
	{
		"max397574/better-escape.nvim",
		enabled = false,
		config = function()
			require("better_escape").setup()
		end,
	},
}
return M
