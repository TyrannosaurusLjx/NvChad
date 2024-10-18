local map = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

-- Bold mappings
map(0, 'v', '<d-b>', 'xi**<esc>pa**<esc>', opts)
map(0, 'n', '<d-b>', 'viwxi**<esc>pa**<esc>', opts)

-- Italic mappings
map(0, 'v', '<d-i>', 'xi*<esc>pa*<esc>', opts)
map(0, 'n', '<d-i>', 'viwxi*<esc>pa*<esc>', opts)

-- Strikethrough mappings
map(0, 'v', '<d-u>', 'xi~~<esc>pa~~<esc>', opts)
map(0, 'n', '<d-u>', 'viwxi~~<esc>pa~~<esc>', opts)
