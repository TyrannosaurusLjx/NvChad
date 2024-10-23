local map = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

-- Bold mappings
map(0, 'v', '<D-b>', 'xi**<esc>pa**<esc>', opts)
map(0, 'n', '<D-b>', 'viwxi**<esc>pa**<esc>', opts)

-- Italic mappings
map(0, 'v', '<D-i>', 'xi*<esc>pa*<esc>', opts)
map(0, 'n', '<D-i>', 'viwxi*<esc>pa*<esc>', opts)

-- Strikethrough mappings
map(0, 'v', '<D-u>', 'xi~~<esc>pa~~<esc>', opts)
map(0, 'n', '<D-u>', 'viwxi~~<esc>pa~~<esc>', opts)

-- tab for zap
map(0, "n", "<tab>", "za", opts)
