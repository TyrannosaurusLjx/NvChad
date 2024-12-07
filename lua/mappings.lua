require "nvchad.mappings"

local map = vim.keymap.set

-- wiki 快捷键
-- map("n", "<leader>ww", "<CMD>lua require'chadrc'.Journal.toggle(0)<CR>", { noremap = true, silent = true, desc = "Open today's journal" })
-- map("n", "<leader>wt", "<CMD>lua require'chadrc'.Journal.toggle(1)<CR>", { noremap = true, silent = true, desc = "Open today's journal" })
-- map("n", "<leader>wy", "<CMD>lua require'chadrc'.Journal.toggle(-1)<CR>", { noremap = true, silent = true, desc = "Open today's journal" })

map("n", "<leader>tt", "<CMD>lua require'nvimwiki.journal'.today()<CR>")

map("n", "<leader>wf", "<CMD>lua require('telescope.builtin').find_files({cwd = '~/wiki/'})<CR>", { desc = "Search wiki" })
map("n", "<D-F>", "<CMD>lua require('telescope.builtin').find_files({cwd = '~/wiki/'})<CR>", { desc = "Search wiki" })
map("n", "<D-f>", "<CMD>lua require('telescope.builtin').live_grep({cwd = '~/wiki/'})<CR>", { desc = "search wiki content" })
-- map("n", "<leader><CR>", "<CMD>lua require 'mdeval'.eval_code_block()<CR>", {desc = "run code"})
map("i", "<D-i>", "<CMD>lua require'chadrc'.WikiInsertLink()<CR>", { desc = "Insert wiki link" })
map({"n", "v"}, "<F8>", "<CMD>lua require('chadrc').PythonRun.Run()<CR>", { desc = "Insert wiki link" })

map("s", "jk", "<ESC>", { noremap = true })

if vim.g.neovide then
  require("neovide")
else
  require("term")
end

map("n", "<C-s>", "<CMD>lua require'nvimwiki'.setup()<CR>")
map("i", "<C-i>", "<CMD>lua require'nvimwiki.node'.insert()<CR>")
map("n", "<C-c>", "<CMD>lua require'nvimwiki.node'.create()<CR>")
-- map("n", "<C-f>", "<CMD>lua require'nvimwiki.node'.search()<CR>")
-- map("v", "<CR>", "<CMD>lua require'nvimwiki.link'.action.visual.create()<CR>")
-- map("n", "<C-b>", "<CMD>lua require'nvimwiki.link'.action.normal.create()<CR>")
map("n", "<C-r>", "<CMD>luafile %<CR>")