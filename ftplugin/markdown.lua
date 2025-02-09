-- 不在 vscode 里面使用
if vim.g.vscode then
else
  local map = vim.api.nvim_buf_set_keymap
  local opts = { noremap = true, silent = true }

  -- Bold mappings
  -- map(0, "v", "<D-b>", "xi**<esc>pa**<esc>", opts)
  -- map(0, "n", "<D-b>", "viwxi**<esc>pa**<esc>", opts)
  --
  -- -- Italic mappings
  -- map(0, "v", "<D-i>", "xi*<esc>pa*<esc>", opts)
  -- map(0, "n", "<D-i>", "viwxi*<esc>pa*<esc>", opts)
  --
  -- -- Strif vim.g.vscode thenikethrough mappings
  -- map(0, "v", "<D-u>", "xi~~<esc>pa~~<esc>", opts)
  -- map(0, "n", "<D-u>", "viwxi~~<esc>pa~~<esc>", opts)

  -- tab for zap
  map(0, "n", "<tab>", "za", opts)

  map(0, "n", "<F9>", "<CMD>SnipRun<CR>", opts)
  map(0, "v", "<F9>", ":SnipRun<CR>", opts)
  map(0, "n", "<F8>", "<CMD>MarkdownPreview<CR>", opts)

  -- map(0, "n", "<CR>", "<CMD>lua require'nvimwiki.link'.Enter()<CR>", opts)
  -- map(0, "v", "<CR>", "<CMD>lua require'nvimwiki.link'.Enter()<CR>", opts)
  -- map(0, "n", "[[", "<CMD>MkdnGoBack<CR>", opts)
  -- map(0, "n", "]]", "<CMD>MkdnGoForward<CR>", opts)

  vim.api.nvim_set_hl(0, "@spell.markdown", { fg = "#ABB2BF"})
end
