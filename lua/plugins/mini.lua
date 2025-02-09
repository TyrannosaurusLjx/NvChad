local M = {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			-- 增强的],[移动
			require("mini.bracketed").setup()
		end,
	},
}

return M
