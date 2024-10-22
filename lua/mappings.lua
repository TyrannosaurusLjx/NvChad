require "nvchad.mappings"


-- add yours here

local map = vim.keymap.set

map({"n", "v"}, ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "Q", "<CMD>q<CR>")


-- jump to mappings
map("n", "<D-,>", "<CMD>edit ~/.config/nvim/lua/mappings.lua<CR>", {desc = "jump to mappings"})
map("n", "<D-lt>", function ()
  vim.cmd("tcd ~/.config/nvim")
  vim.cmd("SessionRestore")
  vim.cmd("NvimTreeToggle")
end)


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- buffer 管理y
map("n", "<D-w>", "<CMD>lua require('bufdelete').bufdelete(0, true)<CR>")

--tab 
map("n", "<D-S-w>", "<CMD>tabclose<CR>")
map("n", "<D-S-t>", "<CMD>tabnew<CR>")

for i = 1, 9, 1 do
  map("n", string.format("<D-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

map("n", "<D-]>", "<CMD>bnext<CR>")
map("n", "<D-[>", "<CMD>bprevious<CR>")
map("n", "<D-}>", "<CMD>tabNext<CR>")
map("n", "<D-{>", "<CMD>tabprevious<CR>")
-- map("n", "<D-{>", "<CMD>lua require('nvchad.tabufline').move_buf(-1)<CR>")
-- map("n", "<D-}>", "<CMD>lua require('nvchad.tabufline').move_buf(1)<CR>")
map("n", "<tab>", "za")

--markdown 
map("n", "<leader>mp", "<CMD>call mdip#MarkdownClipboardImage()<CR>")

map("n", "<D-a>", "<CMD>AerialToggle<CR>")

-- 文件搜索等
map("n", "<D-F>", "<CMD>Telescope live_grep<CR>",{noremap = true,silent = true})
map("n", "<D-E>", "<CMD>Telescope find_files<CR>")
map("n", "<D-f>", "<CMD>Telescope current_buffer_fuzzy_find<CR>")

-- 取消搜索高亮
map("n", "//", "<CMD>nohl<CR>")

-- 匹配
map("i", "<D-n>", "<C-p>")

--向后删除
map({"i", "c"}, "<D-backspace>", "<Right><backspace>" )

--下一行
map("i", "<D-enter>", "<ESC>o")

--撤销撤销
map("n", "U", "<C-r>")
map("n", "<D-z>", "u")
map("n", "<D-Z>", "<C-r>")

-- comment 注释
map("n", "<leadr-/>", function()
    require("Comment.api").toggle.linewise.current()
  end, { desc = "Comment Toggle" })
map("n", "<D-/>", function()
    require("Comment.api").toggle.linewise.current()
  end, { desc = "Comment Toggle" })

map("v", "<leader-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { desc = "Comment Toggle" }
)

-- flash
map({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump() <CR>", {desc = "Flash" })
map({ "n", "x", "o" }, "S" ,"<CMD>lua require('flash').treesitter() <CR>" , {desc = "Flash Treesitter"} )
map({ "o", "x" }, "R", "<CMD>lua require('flash').treesitter_search() <CR>", {desc = "Treesitter Search"} )


--窗口管理
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")
map("n", "<D-h>", "<C-w>h")
map("n", "<D-j>", "<C-w>j")
map("n", "<D-k>", "<C-w>k")
map("n", "<D-l>", "<C-w>l")
map("n", "<D-L>","<CMD>:vsplit<CR><CMD>Telescope buffers<CR>")
map("n", "<D-H>","<CMD>:vsplit<CR><C-w>h<CMD>Telescope buffers<CR>")
map("n", "<D-J>","<CMD>:split<CR><CMD>Telescope buffers<CR>")
map("n", "<D-K>","<CMD>:split<CR><C-w>k<CMD>Telescope buffers<CR>")

-- 终端
-- map("n", {"<C-`>", "<D-t>"}, "<CMD>")

-- 部分移动按键
map({"i", "c"}, "<D-j>", "<Down>")
map({"i", "c"}, "<D-k>", "<Up>")
map({"i", "c"}, "<D-h>", "<Left>")
map({"i", "c"}, "<D-l>", "<Right>")

map({"n", "v"}, "J" , "<C-d>" )
map({"n", "v"}, "K" , "<C-u>" )

map({"n"}, "L", "$")
map({"n"}, "H", "^")


-- 类vscode 按键
map({"i", "n"}, "<D-s>", function ()
  if vim.bo.filetype == "tex" then
    vim.cmd("w")
    vim.cmd("silent !xelatex %")
  else
    vim.cmd("w")
  end
  vim.api.nvim_input('<ESC>')

end)

-- bookmark
map("n", "<leader>ml", "<CMD>lua require'bookmarks'.toggle_bookmarks()<CR>" )
map("n", "<leader>mm", "<CMD>lua require'bookmarks'.add_bookmarks(true)<CR>")
-- map("n", "<leader>ml", "<CMD>lua require'bookmarks'.toggle_bookmarks()<CR>")

--文件预览和 trouble
map("n", "<D-e>", "<CMD>NvimTreeToggle<CR>")
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
end) -- preview


map("n", "<leader>tl", function ()
  vim.cmd("NvimTreeFocus")
  vim.cmd("Trouble diagnostics filter.severity=vim.diagnostic.severity.ERROR win.relative=win win.position=bottom")
end)


-- session 最近打开的项目
map("n", "<D-R>", "<CMD>Telescope session-lens<CR>")
map("n", "<D-r>", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })


-- <F8>
map("n", "<F8>", "", {
  noremap = true,
  silent = true,
  callback = function()
    -- 如果是 markdown 文件
    if vim.bo.filetype == "markdown" then
      vim.cmd("MarkdownPreview")
    elseif vim.bo.filetype == "tex" then
      -- 运行 xelatex
      vim.cmd("silent !xelatex % &")
    else
      print("不支持的文件类型")
    end
  end
})

-- 复制粘贴
map({"n", "v"}, "<D-c>", '"+y')
map({"n", "c", "i"}, "<D-v>", "<C-r>+")


-- terminal
map("n", "<D-t>", function()
  require("nvchad.term").toggle { pos = "float", size = 0.3 }
end, { desc = "Creat Float Terminal" })

map("n", "<C-`>", function()
  require("nvchad.term").toggle { pos = "sp" , size = 0.25 }
end, { desc = "Creat horizon Terminal" })

-- 隐藏 terminal,关闭的话就 exit
map("t", "<ESC>",function ()
  vim.api.nvim_input('<C-\\><C-N>')
  require('nvchad.tabufline').close_buffer()
end,{noremap = true, silent = true})


map("n", "?", function ()
  -- show help, ~/.config/nvim/Tutor/*.txt
  -- 获取文件内容
  local file = vim.fn.expand("~/.config/nvim/temp/temp")
  -- 打印内容
  vim.cmd("edit " .. file)
end)

--rename
map("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })


-- map("n", "<tab>", function()
--   require("menu").open("default")
-- end, {})

map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})


map("n", "<D-o>", function()
  local tree_focus = vim.bo.filetype == "NvimTree"

  -- 如果在文件树中, 直接调用 nvim 的 api 打开文件
  if tree_focus then
    require("nvim-tree.api").node.run.system()
  else
    -- 否则, 需要判断光标下的文件类型
    local file_path = vim.fn.expand("<cfile>")   -- 获取光标下的文件名
    local current_dir = vim.fn.expand("%:p:h")   -- 获取当前文件所在的目录
    local full_path = current_dir .. '/' .. file_path  -- 拼接完整路径

    local isweb = string.match(file_path, "http") or string.match(file_path, "https")
    local ispdf = string.match(file_path, "pdf")
    local isimg = string.match(file_path, "png") or string.match(full_path, "jpg") or string.match(full_path, "jpeg")

    if isweb then
      --如果是网页,那么用浏览器打开
      vim.cmd("silent !open '" .. file_path .. "'")  -- 直接使用光标下的路径，而不是拼接路径
      print('open web ' .. file_path)

    elseif isimg then
      --如果是图片，那么用预览打开
      vim.cmd("silent !open " .. full_path)  -- 使用拼接路径
      print(full_path)

    elseif ispdf then
      vim.cmd("silent !open " .. full_path)

    else
      --文件
      if vim.fn.filereadable(full_path) == 1 then
        vim.cmd('edit ' .. full_path)   -- 如果文件存在，打开它
      else
        local choice = vim.fn.input("File does not exist. Create new file? (y/n): ")
        if choice:lower() == 'y' then
          vim.cmd('edit ' .. full_path)   -- 如果文件不存在，新建文件
          print("New file created: " .. full_path)
        else
          print("File not created.")
        end
      end
    end

  end

end)


-- journal
vim.api.nvim_create_user_command('Today', function()
  local today = os.date("%Y-%m-%d")
  local filepath = vim.fn.expand("~/map/Journal/" .. today .. ".md")

  -- 如果文件不存在，创建并写入日期标题
  if vim.fn.filereadable(filepath) == 0 then
    vim.cmd('silent !echo "\\# ' .. today .. '" > ' .. filepath)
  end

  -- 打开文件
  vim.cmd('edit ' .. filepath)
end, {})

-- journal today
map("n", "<leader>jt", "<CMD>Today<CR>",{noremap = true, silent = true, desc = "today's journal"})
-- journal date search
map("n", "<leader>js", "<CMD>lua require('telescope.builtin').find_files({cwd = '~/map/Journal/'})<CR>",{noremap = true, silent = true, desc = "search journal depending on date"})
-- journal content search
map("n", "<leader>j<S-s>", "<CMD>lua require('telescope.builtin').live_grep({cwd = '~/map/Journal/'})<CR>", {  desc = "search journal depending on content" })


