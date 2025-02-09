return {
	{
		"crusj/bookmarks.nvim",
		-- enabled = false,
		dependencies = { "nvim-web-devicons" },
		keys = {},
		config = function()
			require("bookmarks").setup()
			-- require("telescope").load_extension("bookmarks")
		end,
	},
}
