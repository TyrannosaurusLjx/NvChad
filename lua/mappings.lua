require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map({"n", "v"}, ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "Q", "<CMD>q<CR>", { desc = "Quit" })

-- jump to mappings
map("n", "<D-,>", "<CMD>edit ~/.config/nvim/lua/mappings.lua<CR>", {desc = "jump to mappings"})
map("n", "<D-lt>", function ()
  vim.cmd("tcd ~/.config/nvim")
  vim.cmd("SessionRestore")
  vim.cmd("NvimTreeToggle")
end, {desc = "Switch to NVim config and restore session"})

-- buffer 管理
map("n", "<D-w>", "<CMD>lua require('bufdelete').bufdelete(0, true)<CR>", { desc = "Close buffer" })

--tab 
map("n", "<D-S-w>", "<CMD>tabclose<CR>", { desc = "Close tab" })
map("n", "<D-S-t>", "<CMD>tabnew<CR>", { desc = "New tab" })

for i = 1, 9, 1 do
  map("n", string.format("<D-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { desc = string.format("Switch to tab %d", i) })
end

map("n", "<D-]>", "<CMD>bnext<CR>", { desc = "Next buffer" })
map("n", "<D-[>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<D-}>", "<CMD>tabNext<CR>", { desc = "Next tab" })
map("n", "<D-{>", "<CMD>tabprevious<CR>", { desc = "Previous tab" })
map("n", "<tab>", "za", { desc = "Toggle fold" })

--markdown 
map("n", "<leader>mp", "<CMD>call mdip#MarkdownClipboardImage()<CR>", { desc = "Paste image from clipboard" })

map("n", "<D-a>", "<CMD>AerialToggle<CR>", { desc = "Toggle Aerial" })

-- 文件搜索等
map("n", "<D-F>", "<CMD>Telescope live_grep<CR>",{noremap = true,silent = true, desc = "Live grep"})
map("n", "<D-e>", "<CMD>Telescope buffers<CR>", { desc = "List buffers" })
map("n", "<D-O>", "<CMD>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<D-f>", "<CMD>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current buffer" })

-- 取消搜索高亮
map("n", "//", "<CMD>nohl<CR>", { desc = "Clear search highlight" })

-- 匹配
map("i", "<D-n>", "<C-p>", { desc = "Autocomplete previous" })

--向后删除
map({"i", "c"}, "<D-backspace>", "<Right><backspace>", { desc = "Delete character after cursor" })

--下一行
map("i", "<D-enter>", "<ESC>o", { desc = "Insert new line" })

--撤销撤销
map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "<D-z>", "u", { desc = "Undo" })
map("n", "<D-Z>", "<C-r>", { desc = "Redo" })

-- comment 注释
map("n", "<leader-/>", function()
    require("Comment.api").toggle.linewise.current()
  end, { desc = "Comment Toggle" })
map("n", "<D-/>", function()
    require("Comment.api").toggle.linewise.current()
  end, { desc = "Comment Toggle" })

map("v", "<leader-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { desc = "Comment Toggle" }
)

-- flash
map({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump() <CR>", {desc = "Flash Jump" })
map({ "n", "x", "o" }, "S" ,"<CMD>lua require('flash').treesitter() <CR>" , {desc = "Flash Treesitter"} )
map({ "o", "x" }, "R", "<CMD>lua require('flash').treesitter_search() <CR>", {desc = "Treesitter Search"} )

--窗口管理
map("n", "<leader>h", "<C-w>h", { desc = "Move left" })
map("n", "<leader>j", "<C-w>j", { desc = "Move down" })
map("n", "<leader>k", "<C-w>k", { desc = "Move up" })
map("n", "<leader>l", "<C-w>l", { desc = "Move right" })
map("n", "<D-h>", "<C-w>h", { desc = "Move left" })
map("n", "<D-j>", "<C-w>j", { desc = "Move down" })
map("n", "<D-k>", "<C-w>k", { desc = "Move up" })
map("n", "<D-l>", "<C-w>l", { desc = "Move right" })
map("n", "<D-L>", "<CMD>:vsplit<CR><CMD>Telescope buffers<CR>", { desc = "Vertical split and list buffers" })
map("n", "<D-H>", "<CMD>:vsplit<CR><C-w>h<CMD>Telescope buffers<CR>", { desc = "Vertical split and move left" })
map("n", "<D-J>", "<CMD>:split<CR><CMD>Telescope buffers<CR>", { desc = "Horizontal split and list buffers" })
map("n", "<D-K>", "<CMD>:split<CR><C-w>k<CMD>Telescope buffers<CR>", { desc = "Horizontal split and move up" })

--终端
map("n", "<D-t>", function()
  require("nvchad.term").toggle { pos = "float", size = 0.3 }
end, { desc = "Create Float Terminal" })

map("n", "<C-`>", function()
  require("nvchad.term").toggle { pos = "sp" , size = 0.25 }
end, { desc = "Create horizon Terminal" })

-- 隐藏 terminal,关闭的话就 exit
map("t", "<ESC>",function ()
  vim.api.nvim_input('<C-\\><C-N>')
  require('nvchad.tabufline').close_buffer()
end,{noremap = true, silent = true, desc = "Hide terminal and exit"})

-- bookmark
map("n", "<leader>ml", "<CMD>lua require'bookmarks'.toggle_bookmarks()<CR>", { desc = "Toggle bookmarks" })
map("n", "<leader>mm", "<CMD>lua require'bookmarks'.add_bookmarks(true)<CR>", { desc = "Add bookmarks" })

--文件预览和 trouble
map("n", "<D-E>", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<D-p>", function ()
  local win_id = vim.api.nvim_get_current_win()
  local buf_id = vim.api.nvim_win_get_buf(win_id)
  local buf_name = vim.api.nvim_buf_get_name(buf_id)

  -- Check if the buffer name contains 'NvimTree'
  if string.match(buf_name, "NvimTree") then
    -- If in NvimTree, execute nvim-tree-preview watch
    vim.cmd('lua require("nvim-tree-preview").watch()')
  else
    -- Otherwise, toggle Trouble diagnostics
    vim.cmd("lua require('goto-preview').goto_preview_definition()")
  end
end, { desc = "Preview file or diagnostics" })

map("n", "<leader>tl", function ()
  vim.cmd("NvimTreeFocus")
  vim.cmd("Trouble diagnostics filter.severity=vim.diagnostic.severity.ERROR win.relative=win win.position=bottom")
end, { desc = "Focus NvimTree and show Trouble diagnostics" })

-- session 最近打开的项目
map("n", "<D-R>", "<CMD>Telescope session-lens<CR>", { desc = "Session lens" })
map("n", "<D-r>", "<cmd>Telescope oldfiles<CR>", { desc = "Find old files" })

-- <F8>
map("n", "<F8>", "", {
  noremap = true,
  silent = true,
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.cmd("MarkdownPreview")
    elseif vim.bo.filetype == "tex" then
      vim.cmd("silent !xelatex % &")
    else
      print("Unsupported file type")
    end
  end,
  desc = "File type-specific action"
})

-- 复制当前选中的内容到系统剪贴板
map({"n", "v"}, "<D-c>", '"+y', { desc = "Copy to system clipboard" })

-- 粘贴系统剪贴板的内容
map({"n", "c", "i"}, "<D-v>", "<C-r>+", { desc = "Paste from system clipboard" })

-- 创建浮动终端窗口
map("n", "<D-t>", function()
  require("nvchad.term").toggle { pos = "float", size = 0.3 }
end, { desc = "Create Float Terminal" })

-- 创建水平终端窗口
map("n", "<C-`>", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.25 }
end, { desc = "Create Horizontal Terminal" })

-- 关闭终端窗口时退出
map("t", "<ESC>", function()
  vim.api.nvim_input('<C-\\><C-N>')  -- 退出终端模式
  require('nvchad.tabufline').close_buffer()
end, { noremap = true, silent = true, desc = "Close terminal and exit" })

map("n", "?", function()
  -- 打开临时文件 ~/.config/nvim/temp/temp
  local file = vim.fn.expand("~/.config/nvim/temp/temp")
  vim.cmd("edit " .. file)
end, { desc = "Show temp file" })

map("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")  -- 使用当前单词作为默认重命名
end, { expr = true, desc = "Rename symbol" })

map("n", "<RightMouse>", function()
  -- 正常模式下执行鼠标右键事件
  vim.cmd('normal! \\<RightMouse>')

  -- 如果在 NvimTree 中，打开对应的菜单；否则打开默认菜单
  local options = vim.bo.filetype == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Open context menu" })


map("n", "<D-o>", function()
  local tree_focus = vim.bo.filetype == "NvimTree"

  if tree_focus then
    -- 如果在 NvimTree 中，打开系统默认的文件打开方式
    require("nvim-tree.api").node.run.system()
  else
    -- 获取光标下的文件路径并判断类型
    local file_path = vim.fn.expand("<cfile>")
    local current_dir = vim.fn.expand("%:p:h")
    local full_path = current_dir .. '/' .. file_path

    local is_web = string.match(file_path, "http") or string.match(file_path, "https")
    local is_pdf = string.match(file_path, "pdf")
    local is_img = string.match(full_path, "png") or string.match(full_path, "jpg") or string.match(full_path, "jpeg")

    if is_web then
      vim.cmd("silent !open '" .. file_path .. "'")  -- 打开网页
      print('Open web: ' .. file_path)

    elseif is_img then
      vim.cmd("silent !open " .. full_path)  -- 打开图片
      print('Open image: ' .. full_path)

    elseif is_pdf then
      vim.cmd("silent !open " .. full_path)  -- 打开 PDF

    else
      -- 检查文件是否存在，不存在则询问是否创建
      if vim.fn.filereadable(full_path) == 1 then
        vim.cmd('edit ' .. full_path)
      else
        local choice = vim.fn.input("File does not exist. Create new file? (y/n): ")
        if choice:lower() == 'y' then
          vim.cmd('edit ' .. full_path)
          print("New file created: " .. full_path)
        else
          print("File not created.")
        end
      end
    end
  end
end, { desc = "Open file or link" })

-- 创建并打开当天的 journal
vim.api.nvim_create_user_command('Today', function()
  local today = os.date("%Y-%m-%d")
  local filepath = vim.fn.expand("~/map/Journal/" .. today .. ".md")

  if vim.fn.filereadable(filepath) == 0 then
    vim.cmd('silent !echo "\\# ' .. today .. '" > ' .. filepath)
  end

  vim.cmd('edit ' .. filepath)
end, { desc = "Open today's journal" })

-- 快捷键
map("n", "<leader>jt", "<CMD>Today<CR>", { noremap = true, silent = true, desc = "Open today's journal" })
map("n", "<leader>js", "<CMD>lua require('telescope.builtin').find_files({cwd = '~/map/Journal/'})<CR>", { desc = "Search journal by date" })
map("n", "<leader>j<S-s>", "<CMD>lua require('telescope.builtin').live_grep({cwd = '~/map/Journal/'})<CR>", { desc = "Search journal by content" })

