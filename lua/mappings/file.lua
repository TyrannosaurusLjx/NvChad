Keymaps(
  "n",
  { "<leader>fo", "<leader>fr" },
  "<CMD>lua require'telescope.builtin'.oldfiles()<CR>",
  { desc = "Open recent file" }
)

Keymaps("n", { "<leader>ff", "<D-o>", "<D-O>", "<D-F>" }, function()
  require("telescope.builtin").find_files(require("telescope.themes").get_ivy {
    layout_config = {
      height = 0.3, -- 窗口高度占屏幕 20%
    },
  })
end, { desc = "Find files" })

Keymap(
  "n",
  "<leader>fc",
  "<CMD>lua require'telescope.builtin'.find_files({cwd = '~/.config/nvim'})<CR>",
  { desc = "Find files in nvim config" }
)
Keymap(
  "n",
  "<leader>fC",
  "<CMD>lua require'telescope.builtin'.live_grep({cmd=vim.fn.stdpath('config')})<CR>",
  { desc = "live_grep in config" }
)

Keymap("n", "<D-f>", "<CMD>lua require'telescope.builtin'.live_grep()<CR>", { desc = "live grep" })
Keymap("n", "<leader><space>", "<CMD>lua Snacks.explorer()<CR>", { desc = "File Explorer" })
