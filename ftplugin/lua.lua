-- 不在 vscode 里面使用
if vim.g.vscode then
else
	local map = vim.api.nvim_buf_set_keymap
	local opts = { noremap = true, silent = true }

	map(0, "n", "<F8>", ":luafile %<CR>", opts)
end
