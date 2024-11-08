-- 不在 vscode 里面使用
-- if vim.g.vscode then
--
-- else
--
--
-- local map = vim.api.nvim_buf_set_keymap
-- local opts = { noremap = true, silent = true }
--
-- map(0,"n", "<F8>", ":!python3 %<CR>", opts)
--
-- end

if not vim.g.vscode then
  local map = vim.api.nvim_buf_set_keymap
  local opts = { noremap = true, silent = true }

  -- 使用 jobstart 来异步运行 Python 程序
  map(0, "n", "<F8>", ":lua RunPythonAsync()<CR>", opts)

  function RunPythonAsync()
    local file = vim.fn.expand("%")  -- 获取当前文件路径
    -- 使用 jobstart 异步运行 Python 文件
    vim.fn.jobstart({ "python3", file }, {
      on_stdout = function(_, data)
        if data then
          vim.api.nvim_out_write(table.concat(data, "\n") .. "\n")
        end
      end,
      on_stderr = function(_, data)
        if data then
          vim.api.nvim_err_writeln(table.concat(data, "\n"))
        end
      end,
      on_exit = function(_, code)
        if code == 0 then
          vim.api.nvim_out_write("Python script completed successfully.\n")
        else
          vim.api.nvim_err_writeln("Python script exited with errors.")
        end
      end,
    })
  end
end
