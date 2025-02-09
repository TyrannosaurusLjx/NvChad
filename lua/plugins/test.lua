return {
	"TyrannosaurusLjx/Test",
	ft = { "md", "markdown" },
	-- opts = {
	-- 	root_dir = "~/aaa"
	-- },
	dependencies = {
		--telescope
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("wiki").setup({
			root_dir = "~/aaa",
			default_mix_dir = "python",
			default_mix_name = "1",
		})
	end,
}
