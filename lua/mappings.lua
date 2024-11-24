require "nvchad.mappings"

local map = vim.keymap.set

-- wiki 快捷键
map("n", "<leader>ww", "<CMD>Today<CR>", { noremap = true, silent = true, desc = "Open today's journal" })
map("n", "<leader>wf", "<CMD>lua require('telescope.builtin').find_files({cwd = '~/wiki/'})<CR>", { desc = "Search wiki" })
map("n", "<D-f>", "<CMD>lua require('telescope.builtin').find_files({cwd = '~/wiki/'})<CR>", { desc = "Search wiki" })
map("n", "<D-F>", "<CMD>lua require('telescope.builtin').live_grep({cwd = '~/wiki/'})<CR>", { desc = "search wiki content" })
-- map("n", "<leader><CR>", "<CMD>lua require 'mdeval'.eval_code_block()<CR>", {desc = "run code"})
map("i", "<D-i>", "<CMD>lua require'chadrc'.WikiInsertLink()<CR>", { desc = "Insert wiki link" })
map("v", "<leader><CR>", "<CMD>lua require('chadrc').PythonRun.Run()<CR>", { desc = "Insert wiki link" })


if vim.g.neovide then
  require("neovide")
else
  require("term")
end
