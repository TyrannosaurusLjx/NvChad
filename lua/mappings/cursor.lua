local mc = require("multicursor-nvim")
Keymap({ "n", "v" }, ";", ":", { desc = "CMD enter command mode" })
Keymap({ "i", "n", "v", "t" }, "<D-x>", "<ESC><ESC>:")
Keymap({ "i", "n", "v", "t" }, "<F1>", "<esc>")
Keymap({ "i", "s" }, "jk", "<ESC>zz")
Keymap({ "n", "v" }, "<D-P>", ":", { desc = "CMD enter command mode" })
Keymap("n", "<D-,>", "<CMD>edit ~/.config/nvim/lua/mappings/init.lua<CR>", { desc = "jump to mappings" })

Keymap("n", "Q", "<CMD>q<CR>", { desc = "Quit" })
Keymap({ "i", "c" }, "<D-h>", "<left>", { desc = "Move left" })
Keymap({ "i", "c" }, "<D-l>", "<right>", { desc = "Move right" })
Keymap({ "i", "c" }, "<D-j>", "<down>", { desc = "Move down" })
Keymap({ "i", "c" }, "<D-k>", "<up>", { desc = "Move up" })
--flash
Keymap({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump() <CR>", { desc = "Flash Jump" })
Keymap({ "n", "x", "o" }, "S", "<CMD>lua require('flash').treesitter() <CR>", { desc = "Flash Treesitter" })
Keymap({ "o", "x" }, "R", "<CMD>lua require('flash').treesitter_search() <CR>", { desc = "Treesitter Search" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
Keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
Keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
Keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
Keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
Keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
Keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
Keymap("i", ",", ",<c-g>u")
Keymap("i", ".", ".<c-g>u")
Keymap("i", ";", ";<c-g>u")
Keymap("i", "<CR>", "<CR><C-g>u")

Keymap({ "n", "v" }, "J", "5j", { desc = "Scroll down", noremap = true, silent = true })
Keymap({ "n", "v" }, "K", "5k", { desc = "Scroll up", noremap = true, silent = true })
Keymap({ "n", "v", "s" }, "L", "$", { desc = "Move to end of line", noremap = true, silent = true })
Keymap({ "n", "v", "s" }, "H", "^", { desc = "Move to start of line", noremap = true, silent = true })
Keymap("n", "Y", "Vy", { desc = "Yank line" })
Keymap("n", "X", "dd", { desc = "Delete line" })
Keymap("i", "<D-n>", "<C-p>", { desc = "Autocomplete previous" })
Keymap({ "i", "c" }, "<D-backspace>", "<delete>", { desc = "Delete character after cursor" })
Keymap("i", "<D-enter>", "<ESC>o", { desc = "Insert new line" })
Keymap("n", "U", "<C-r>", { desc = "Redo" })
Keymap("n", "<D-z>", "u", { desc = "Undo" })
Keymap("n", "<D-Z>", "<C-r>", { desc = "Redo" })
Keymap({ "n", "v" }, "<D-c>", '"+y', { desc = "Copy to system clipboard" })
Keymap({ "c", "i" }, "<D-v>", "<C-r>+", { desc = "Paste from system clipboard" })
Keymap("t", "<D-v>", "<C-\\><C-N>pi", { desc = "Paste from system clipboard" })
Keymap("n", "+", function()
	require("dial.map").manipulate("increment", "normal")
end)
Keymap("n", "-", function()
	require("dial.map").manipulate("decrement", "normal")
end)
Keymap("i", "<D-Space>", "<CMD>lua require'luasnip'.expand()<CR>")

-- Add and remove cursors with control + left click.
Keymap("n", "<D-leftmouse>", mc.handleMouse)

-- Append/insert for each line of visual selections.
Keymap("v", "I", mc.insertVisual)
Keymap("v", "A", mc.appendVisual)
Keymap({ "n", "v" }, "<D-d>", function()
	mc.matchAddCursor(1)
end)
Keymap({ "n", "v" }, "<D-S-d>", function()
	mc.matchSkipCursor(1)
end)

-- Clear search with <esc>
Keymap({ "i", "n" }, "<esc>", function()
	if not mc.cursorsEnabled() then
		mc.enableCursors()
	elseif mc.hasCursors() then
		mc.clearCursors()
	else
		vim.cmd("noh")
		vim.cmd("stopinsert")
	end
end, { desc = "Escape and Clear hlsearch" })

--[[
insert = "<C-g>s",
insert_line = "<C-g>S",
normal = "gys",
normal_cur = "gySS",
normal_line = "gyS",
normal_cur_line = "gySS",
visual = "ys",
visual_line = "yS",
delete = "gds",
change = "gcs",
change_line = "gcS",
--]]

Keymap("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
Keymap("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
Keymap("n", "<D-/>", "gcc")
Keymap("v", "<D-/>", "gc")
