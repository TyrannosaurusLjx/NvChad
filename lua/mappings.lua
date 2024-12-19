require "nvchad.mappings"
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map({ "n", "v" }, "<M-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
map({ "n", "v" }, "<M-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
map({ "n", "v" }, "<M-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")

map({ "n", "v" }, ";", ":", { desc = "CMD enter command mode" })
map({ "i", "s" }, "jk", "<ESC>zz")
map("n", "Q", "<CMD>q<CR>", { desc = "Quit" })

map({ "i", "c" }, "<D-h>", "<left>", { desc = "Move left" })
map({ "i", "c" }, "<D-j>", "<down>", { desc = "Move down" })
map({ "i", "c" }, "<D-k>", "<up>", { desc = "Move up" })
map({ "i", "c" }, "<D-l>", "<right>", { desc = "Move right" })


-- jump to mappings
map("n", "<D-,>", "<CMD>edit ~/.config/nvim/lua/mappings.lua<CR>", { desc = "jump to mappings" })
map("n", "<leader>ft", "<CMD>lua require'telescope.builtin'.help_tags()<CR>")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

--search file
map("n", "<D-F>", "<CMD>lua require'telescope.builtin'.find_files()<CR>")
map("n", "<D-f>", "<CMD>lua require'telescope.builtin'.live_grep()<CR>")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- map("n", "<D-w>", function()
--   require("nvchad.tabufline").close_buffer()
-- end, { desc = "buffer close" })

map("n", "<D-S-w>", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
map("i", "<D-s>", "<ESC>:w<CR>", { desc = "Save", noremap = true, silent = true })
map("n", "<D-s>", "<ESC>:w<CR>", { desc = "Save", noremap = true, silent = true })
map("n", "<D-[>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<D-]>", "<cmd>bnext<cr>", { desc = "Next Buffer" })


map({ "n", "v" }, "J", "5j", { desc = "Scroll down", noremap = true, silent = true })
map({ "n", "v" }, "K", "5k", { desc = "Scroll up", noremap = true, silent = true })


map({ "n", "v" }, "L", "$", { desc = "Move to end of line", noremap = true, silent = true })
map({ "n", "v" }, "H", "^", { desc = "Move to start of line", noremap = true, silent = true })



--markdown
map("n", "<leader>mp", "<CMD>call mdip#MarkdownClipboardImage()<CR>", { desc = "Paste image from clipboard" })


-- 文件搜索等
-- map("n", "<D-F>", "<CMD>Telescope live_grep<CR>",{noremap = true,silent = true, desc = "Live grep"})
map("n", "<D-b>", "<CMD>Telescope buffers<CR>", { desc = "List buffers" })
map("n", "<D-e>", "<CMD>Telescope find_files<CR>", { desc = "File browser" })
map("n", "<D-o>", "<CMD>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<D-E>", "<CMD>Neotree filesystem position=left<CR>", { desc = "Toggle Neotree"})
map("n", "<D-B>", "<CMD>Neotree buffers position=right<CR>", { desc = "Toggle buffers Neotree" })
map("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle Neotree"})

-- 匹配
map("i", "<D-n>", "<C-p>", { desc = "Autocomplete previous" })

--向后删除
map({ "i", "c" }, "<D-backspace>", "<delete>", { desc = "Delete character after cursor" })

--下一行
map("i", "<D-enter>", "<ESC>o", { desc = "Insert new line" })

--撤销撤销
map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "<D-z>", "u", { desc = "Undo" })
map("n", "<D-Z>", "<C-r>", { desc = "Redo" })

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
map("n", "<D-/>", "gcc")
map("v", "<D-/>", "gc")



-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- flash
map({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump() <CR>", { desc = "Flash Jump" })
map({ "n", "x", "o" }, "S", "<CMD>lua require('flash').treesitter() <CR>", { desc = "Flash Treesitter" })
map({ "o", "x" }, "R", "<CMD>lua require('flash').treesitter_search() <CR>", { desc = "Treesitter Search" })

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
map("n", "<d-right>", "<C-w>>", { desc = "Move window right" })
map("n", "<d-left>", "<C-w><", { desc = "Move window left" })
map("n", "<d-up>", "<C-w>+", { desc = "Move window up" })
map("n", "<d-down>", "<C-w>-", { desc = "Move window down" })

-- bookmark
map("n", "gm", "<CMD>lua require'bookmarks'.toggle_bookmarks()<CR>", { desc = "Toggle bookmarks" })
map("n", "mm", "<CMD>lua require'bookmarks'.add_bookmarks(true)<CR>", { desc = "Add bookmarks" })


map("n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", { desc = "Show hover doc" })


-- 复制当前选中的内容到系统剪贴板
map({ "n", "v" }, "<D-c>", '"+y', { desc = "Copy to system clipboard" })

-- 粘贴系统剪贴板的内容
map({ "c", "i" }, "<D-v>", "<C-r>+", { desc = "Paste from system clipboard" })
map("t", "<D-v>", "<C-\\><C-N>pi", { desc = "Paste from system clipboard" })


map("n", "<F9>", "", {
  noremap = true,
  silent = true,
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.cmd("MarkdownPreview")
    elseif vim.bo.filetype == "tex" then
      vim.cmd("silent !xelatex % &")
    elseif vim.bo.filetype == "lua" or vim.bo.filetype == "luale type" then
      vim.cmd("luafile %")
    else
      print("Unsupported file type")
    end
  end,
  desc = "File type-specific action",
})

map("n", "<leader>wt", "<CMD>lua require'nvimwiki.journal'.today()<CR>")
map("n", "<leader>wf", "<CMD>lua require'nvimwiki.finder'.search_titles()<CR>")
map("n", "<leader>wc", "<CMD>lua require'nvimwiki.node'.create()<CR>")

map("n", "<S-D-]>", "<CMD>GonvimWorkspaceNext<CR>")
map("n", "<S-D-[>", "<CMD>GonvimWorkspacePrevious<CR>")
map("n", "<D-S-t>", "<CMD>GonvimWorkspaceNew<CR>")

map("n", "<D-=>", [[:lua guifontscale(1)<CR>]], { noremap = true })
map("n", "<D-->", [[:lua guifontscale(-1)<CR>]], { noremap = true })
function guifontscale(n)
  if type(n) ~= "number" then
    return
  end

  local gfa = {}
  for c in vim.gsplit(vim.o.guifont, ":") do
    table.insert(gfa, c)
  end
  local buildnewgf = ""
  local h_num, w_num, ratio = nil, nil, nil

  for k, v in ipairs(gfa) do
    if v:find("h", 1, true) == 1 then
      h_num = tonumber(v:sub(2))
      h_num = h_num + n
      buildnewgf = buildnewgf .. "h" .. tostring(h_num)
    elseif v:find("w", 1, true) == 1 then
      w_num = tonumber(v:sub(2))
      if h_num then
        ratio = w_num / h_num
        w_num = (h_num + n) * ratio
      else
        w_num = w_num + n
      end
      buildnewgf = buildnewgf .. "w" .. string.format("%.2f", w_num)
    else
      v = string.gsub(v, " ", "_")
      buildnewgf = buildnewgf .. v
    end
    if k ~= #gfa and v ~= "" then
      buildnewgf = buildnewgf .. ":"
    end
  end

  local setcmd = "set guifont=" .. buildnewgf
  vim.cmd(setcmd)

  return 0
end

map("n", "<C-h>", "<CMD>lua require'nvimwiki.utils'.goto_prev()<CR>", { noremap = true })
map("n", "<C-l>", "<CMD>lua require'nvimwiki.utils'.goto_next()<CR>", { noremap = true })
map("n", "<leader>ms", function ()
  local messages = vim.api.nvim_exec("messages", true)
  local file = io.open(vim.fn.expand("~/.config/nvim/temp/messages.txt"), "w")
  if not file then
    vim.notify("Failed to open messages.txt")
    return
  end
  file:write(messages)
  file:close()
  vim.notify("Messages saved to messages.txt")
  vim.cmd("edit ~/.config/nvim/temp/messages.txt")
end)

--------------
local ts_select = require'nvim-treesitter.textobjects.select'
local ts_swap = require'nvim-treesitter.textobjects.swap'
local ts_repeat_move = require'nvim-treesitter.textobjects.repeatable_move'

-- 文本对象选择映射
map({ "x", "o" }, "af", function() ts_select.select_textobject("@function.outer") end)
map({ "x", "o" }, "if", function() ts_select.select_textobject("@function.inner") end)
map({ "x", "o" }, "ac", function() ts_select.select_textobject("@class.outer") end)
map({ "x", "o" }, "ic", function() ts_select.select_textobject("@class.inner") end)
map({ "x", "o" }, "as", function() ts_select.select_textobject("@local.scope") end)
map("n", "<leader>a", function() ts_swap.swap_next("@parameter.inner") end)
map("n", "<leader>A", function() ts_swap.swap_previous("@parameter.inner") end)
map({ "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
map({ "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
map({ "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
map({ "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
-----------

------------ copilot-chat
map({"n","v"}, "<leader>co", "<CMD>CopilotChatOpen<CR>", { desc = "Open Copilot Chat" })
map({"n","v"}, "<leader>cc", "<CMD>CopilotChatClose<CR>", { desc = "Close Copilot Chat" })
map({"n","v"}, "<leader>ct", "<CMD>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
map({"n","v"}, "<leader>cs", "<CMD>CopilotChatStop<CR>", { desc = "Stop Copilot Chat" })
map({"n","v"}, "<leader>cr", "<CMD>CopilotChatReset<CR>", { desc = "Reset Copilot Chat" })
map({"n","v"}, "<leader>cfs", "<CMD>CopilotChatSave default<CR>", {desc = "save copilot chat"} )
map({"n","v"}, "<leader>cfo", "<CMD>CopilotChatLoad default<CR>", {desc = "open copilot chat file"} )
-------------


------------search config file
map("n", "<leader>fc", "<CMD>lua require'telescope.builtin'.find_files({cwd = '~/.config/nvim'})<CR>", { desc = "Find files in nvim config" })
-----------


------------persistence
-- load the session for the current directory
map("n", "<leader>qs", function() require("persistence").load() end)

-- select a session to load
map("n", "<D-R>", function() require("persistence").select() end)

-- load the last session
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end)

-- stop Persistence => session won't be saved on exit
map("n", "<leader>qd", function() require("persistence").stop() end)
---------------


-------------dial
map("n", "+", function()
    require("dial.map").manipulate("increment", "normal")
end)
map("n", "-", function()
    require("dial.map").manipulate("decrement", "normal")
end)
