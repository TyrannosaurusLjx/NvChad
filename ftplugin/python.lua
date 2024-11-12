-- 不在 vscode 里面使用
if vim.g.vscode then

else


local map = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

map(0, "n", "<F8>", ":lua require('nvchad.term').runner { id = 'pyrun', pos = 'sp', cmd = function() local file = vim.fn.expand('%') return 'python3 ' .. file end }<CR>", opts)

end

