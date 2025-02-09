local M = {
	"aaron-p1/match-visual.nvim",
	config = function()
		require("match-visual").setup({
			-- minimum length of text to match
			min_length = 1,
			-- Visual group to use for highlighting
			-- You could also override the "VisualMatch" hl group to change the highlights.
			hl_group = "Visual",
			-- id to use in matchadd(). Only needs to be set if you already use this id
			-- match_id = 118,
		})
	end,
}

return M
