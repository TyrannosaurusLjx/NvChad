vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

--设置 lazy
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  ---------------surround---------------

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    -- config = function()
    --   require("nvim-surround").setup({
    --     -- Configuration here, or leave empty to use defaults
    --
    --   })
    -- end,
    opts = {
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "gys",
        normal_cur = "gySS",
        normal_line = "gyS",
        normal_cur_line = "gySS",
        visual = "gys",
        visual_line = "gyS",
        delete = "gds",
        change = "gcs",
        change_line = "gcS",
      },
    },
  },

  ---------------flash---------------
  {
    "folke/flash.nvim",
    -- event = "VeryLazy",
    opts = {},
  },
}

----------options----------
--设置系统剪切板和 neovim 剪切板同步
vim.opt.clipboard = "unnamedplus"

----------keymap----------
local map = vim.keymap.set
local vscode = require "vscode"
local function keymap(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, function()
    vscode.call(rhs)
  end, { silent = true, noremap = true })
end
-- map("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- flash
map({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump() <CR>")
map({ "n", "x", "o" }, "S", "<CMD>lua require('flash').treesitter() <CR>")

--移动
map({ "n", "v" }, "J", "5j")
map({ "n", "v" }, "K", "5k")
map({ "n", "v" }, "L", "$")
map({ "n", "v" }, "H", "^")
map("n", ";", ":")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", "<CR>", "<CR><C-g>u")

keymap("n", "<leader>nT", "foam-vscode.open-daily-note-for-date")
keymap("n", "<leader>nt", "foam-vscode.open-daily-note")
keymap("n", "<leader>nf", "workbench.action.quickOpen")
keymap("n", "zM", "editor.foldAll")
keymap("n", "zR", "editor.unfoldAll")
keymap("n", "zc", "editor.fold")
keymap("n", "zC", "editor.foldRecursively")
keymap("n", "zo", "editor.unfold")
keymap("n", "zO", "editor.unfoldRecursively")
keymap("n", "za", "editor.toggleFold")
keymap("n", "<leader>ff", "workbench.action.quickTextSearch")
keymap("n", "<leader>fF", "workbench.action.findInFiles")
keymap("n", "<leader>fo", "workbench.action.openRecent")
keymap("n", "<leader>bb", "workbench.action.openPreviousRecentlyUsedEditor")
