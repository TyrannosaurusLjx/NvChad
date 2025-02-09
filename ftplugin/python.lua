-- 不在 vscode 里面使用
if vim.g.vscode then

else


local map = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

PythonRun = function()
  local dir = vim.fn.expand("%:p:h")  -- 获取当前文件的目录
  local file = vim.fn.expand("%:p")   -- 获取当前文件的完整路径
  --lcd dir 并且执行 python file 
  --错误
  vim.cmd("lcd " .. dir)
  vim.cmd("TermExec cmd='python %'")

end


map(0, "n", "<F8>", "<CMD>lua PythonRun()<CR>", opts)
---REPL
map(0, "v", "<F8>", "<CMD>lua require('toggleterm').send_lines_to_terminal('visual_selection', false, { args = vim.v.count })<CR>", opts)

end

