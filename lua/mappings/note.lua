Keymap("n", "<leader>nt", "<CMD>lua Journal(0)<CR>", { desc = "open Today Journal" })
Keymap("n", "<leader>nT", "<CMD>lua Journal(-1)<CR>", { desc = "open Yesterday Journal" })
Keymap(
	"n",
	"<leader>nF",
	"<CMD>lua require'telescope.builtin'.find_files({cwd = '~/wiki'})<CR>",
	{ desc = "wiki search" }
)
Keymap(
	"n",
	"<leader>nf",
	"<CMD>lua require'telescope.builtin'.live_grep({cwd = '~/wiki'})<CR>",
	{ desc = "wiki search by file" }
)
