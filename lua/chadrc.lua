-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

  integrations = {
  "markview"
  }

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- Add the following in your custom/configs/overrides.lua file. You can configure copilot to meet your needs here.
-- M.copilot = {
--   -- Possible configurable fields can be found on:
--   -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
--   suggestion = {
--     enable = false,
--   },
--   panel = {
--     enable = false,
--   },
--   filetypes = {
--     yaml = true,
--     markdown = true,
--     help = false,
--     gitcommit = false,
--     gitrebase = false,
--     hgcommit = false,
--     svn = false,
--     cvs = false,
--     ["."] = false,
--   },
-- }

--重写 

M.ui = {
  nvdash = {
    load_on_startup = false,
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  cmp = {
      style = "atom_colored",
      mapping = (function()
          local cmp = require("cmp")
          local luasnip = require("luasnip")
          return {
              ['<CR>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      if luasnip.expandable() then
                          luasnip.expand()
                      else
                          cmp.confirm({
                              select = true,
                          })
                      end
                  else
                      fallback()
                  end
              end),

              ['<Tab>'] = cmp.mapping(function(fallback)
                  if luasnip.locally_jumpable(1) then
                    luasnip.jump(1)
                  elseif cmp.visible() then
                      cmp.select_next_item()
                  else
                      fallback()
                  end
              end, { "i","s"}),

              ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      cmp.select_prev_item()
                  elseif luasnip.locally_jumpable(-1) then
                      luasnip.jump(-1)
                  else
                      fallback()
                  end
              end,{"i", "s"}),

              sources = {
              name = "nvim_lsp",
            }
          }
      end),
  },

  telescope = {
    style = "bordered",
    extensions = {
      workspaces = {
        -- keep insert mode after selection in the picker, default is false
        keep_insert = true,
        -- Highlight group used for the path in the picker, default is "String"
        path_hl = "String"
      },
    }

  },

  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    order = nil,
    modules = nil,
  },

  tabufline = {
    modules = {
      abc = function ()
        return "hi"
      end
    }
  }
}
--- search wiki
M.WikiSearch = function(path,callback)
    -- 使用 Telescope 的 find_files 函数搜索文件
    require('telescope.builtin').find_files({
      cwd = path,  -- 设置工作目录为指定路径
      prompt_title = "find link",  -- 设置提示框的标题
      attach_mappings = function(_, map)
        -- 当选择文件并按回车时，获取选中的文件
        map({'i','n'}, '<CR>', function(prompt_bufnr)
          -- 统一成normal模式
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), 'n', true)
          local action_state = require('telescope.actions.state')
          local actions = require('telescope.actions')
          -- 获取当前选中的条目（文件）
          local entry = action_state.get_selected_entry()
          -- 调用回调函数，将选中的文件传递给它
          actions.close(prompt_bufnr)  -- 关闭 Telescope 窗口 --必须先关闭窗口,不然会写到窗口中
          callback(entry.value)
        end)
        return true
      end,
    })
end

M.WikiInsertLink = function()
  -- 传递一个回调函数来处理选择的文件
  M.WikiSearch("~/wiki/", function(selected_file)
    if selected_file then
      local luasnip = require("luasnip")
      local snippet = luasnip.parser.parse_snippet("link", "[$1](" .. selected_file .. ")$2")
      luasnip.snip_expand(snippet)
      vim.schedule(function()
        --模拟输入 a进入 Insert 模式
        vim.api.nvim_feedkeys("a", "n", true)
      end)
    else
      print("No file selected!")
    end
  end)
end

M.WikiCapture = function()
  --创建一个 telescope 窗口搜索 wiki 文件
  --如果 telescope 返回了文件就直接编辑,不然就新建
  M.WikiSearch("~/wiki/", function(selected_file)
    if selected_file then
      vim.cmd("e " .. selected_file)
    else
      -- 获取当前时间戳
      local current_time = os.time()
      -- 格式化日期为字符串
      local date = os.date("%Y-%m-%d", current_time)
      -- 构造文件路径
      local file_path = vim.fn.expand("~/wiki/" .. date .. ".md")
      -- 创建文件并写入标题
      vim.fn.system("echo '# " .. date .. "' > " .. file_path)
      vim.cmd("e " .. file_path) -- 打开文件
    end
  end)
end

M.TODO = {
  toggle = function()
    local file = "~/wiki/TODO.md"
    vim.cmd("edit " .. file)
  end
}


M.Journal = {
  toggle = function(n)
    -- 获取当前时间戳
    local current_time = os.time()
    -- 根据 n 的值计算目标日期的时间戳
    local target_time = current_time + (n * 24 * 60 * 60)
    -- 格式化日期为字符串
    local date = os.date("%Y-%m-%d", target_time)
    -- 构造文件路径
    local file_path = vim.fn.expand("~/wiki/" .. date .. ".md")

    -- 检查文件是否存在
    if vim.fn.filereadable(file_path) == 1 then
      vim.cmd("e " .. file_path) -- 打开文件
    else
      -- 创建文件并写入标题
      vim.fn.system("echo '# " .. date .. "' > " .. file_path)
      vim.cmd("e " .. file_path) -- 打开文件
    end
  end,
}

M.PythonRun = {
  -- 这里不需要手动加 \n，直接写多行字符串即可
  header = [[
import os
import numpy as np
import scipy as sp
import pandas as pd
import matplotlib.pyplot as plt
  ]],
  temp_file = "~/.config/nvim/temp/temp.py",
  -- 获取 Visual 模式下的选中文本
  get_visual_selection = function()
    vim.cmd('normal! y')  -- 执行复制命令
    local selected_text = vim.fn.getreg('"')  -- 获取 Visual 模式下的选中文本
    local temp_file = vim.fn.expand(M.PythonRun.temp_file)

    -- 将 header 和选中的文本合并，header 作为第一行
    local lines = vim.fn.split(M.PythonRun.header, "\n")  -- 将 header 拆成行
    local selected_lines = vim.fn.split(selected_text, "\n")  -- 将选中的文本拆成行

    -- 合并 header 和选中的代码
    vim.fn.writefile(vim.list_extend(lines, selected_lines), temp_file)
  end,

  -- 获取 Normal 模式下的代码块
  get_code_block = function()
    -- 获取当前行号
    local current_line = vim.fn.line('.')
    -- 查找上一个 ```python 
    local start_line = vim.fn.search('```python', 'b')
    -- 查找下一个 ```
    local end_line = vim.fn.search('```', 'n')
    -- 获取从 start_line 到 end_line 之间的内容
    local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line - 1, false)
    -- 将 header 和代码块合并
    local header_lines = vim.fn.split(M.PythonRun.header, "\n")
    vim.fn.writefile(vim.list_extend(header_lines, lines), vim.fn.expand(M.PythonRun.temp_file))
  end,

  -- 执行代码块
  Run = function() 
    local mode = vim.fn.mode()
    print("Mode: " .. mode)
    -- 根据模式选择获取选中的文本或代码块
    if mode == "v" or mode == "V" then
      M.PythonRun.get_visual_selection()
    elseif mode == "n" then
      M.PythonRun.get_code_block()
    else
      print("Unsupported mode.")
      return
    end

    local temp_file = vim.fn.expand(M.PythonRun.temp_file)
    -- 执行 Python 脚本并获取输出
    local output = vim.fn.systemlist("python3 " .. temp_file)
    -- 找到文件中的 ` ```python` 和 ` ````
    local start_line = vim.fn.search('```python', 'n') -- 查找向下的 ` ```python`
    local end_line = vim.fn.search('```', 'n') -- 查找向下的 ` ````
  
    -- 如果找到了代码块的开始和结束位置
    if start_line ~= 0 and end_line ~= 0 then
      -- 确定插入位置：结束标记行的下一行
      local insert_line = end_line
      -- 格式化输出
      local formatted_output = {"```output:"}
      if #output == 0 then
        table.insert(formatted_output, "No output.")
      else
        for _, line in ipairs(output) do
          table.insert(formatted_output, line)
        end
      end
      table.insert(formatted_output, "```")
      -- 在代码块后插入结果
      vim.api.nvim_buf_set_lines(0, insert_line, insert_line, false, formatted_output)
    else
      print("No code block found.")
    end
  end

}






return M
