-- 不在 vscode 里面使用
if vim.g.vscode then
else
  local map = vim.api.nvim_buf_set_keymap
  local opts = { noremap = true, silent = true }

  PythonRun = function()
    local dir = vim.fn.expand "%:p:h" -- 获取当前文件的目录
    local file = vim.fn.expand "%:p" -- 获取当前文件的完整路径

    -- 切换到当前文件所在的目录
    vim.cmd("lcd " .. dir)
    -- 构造命令
    local pcmd = "/opt/homebrew/anaconda3/envs/ml/bin/python " .. file
    -- 执行 Python 文件
    require("nvchad.term").toggle { cmd = pcmd, pos = "sp" }
  end

  map(0, "n", "<F8>", "<CMD>terminal python3 %<CR>", opts)
  ---REPL
  map(
    0,
    "v",
    "<F8>",
    "<CMD>lua require('toggleterm').send_lines_to_terminal('visual_selection', false, { args = vim.v.count })<CR>",
    opts
  )
end
