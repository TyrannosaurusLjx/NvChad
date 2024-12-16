vim.g.mapleader = " " -- 设置leader键
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

local map = vim.keymap.set -- 设置键盘映射

--设置 lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- local lazy_config = require "configs.lazy"

-- 在这里继续添加其他插件和配置
require("lazy").setup({
  -- Tree-sitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", -- 运行 TS 更新
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "lua", "python", "javascript", "html", "css", "cpp" }, -- 你需要的语言
        highlight = {
          enable = true,                                                                 -- 开启高亮
          additional_vim_regex_highlighting = false,                                     -- 关闭额外的 regex 高亮
        },
        -- 添加其他 Tree-sitter 配置...
      }
    end,
  },
  -- surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- flash
  {
    "folke/flash.nvim",
    -- event = "VeryLazy",
    opts = {},
  },
  -- {
  --   "rainzm/flash-zh.nvim",
  --   event = "VeryLazy",
  --   dependencies = "folke/flash.nvim",
  --   keys = {{
  --       "s",
  --       mode = {"n", "x", "o"},
  --       function()
  --           require("flash-zh").jump({
  --               chinese_only = false
  --           })
  --       end,
  --       desc = "Flash between Chinese"
  --   }}
  -- },
  --


})

--- neovim-ui
-- vim.cmd([[
--     " THEME CHANGER
--     function! SetCursorLineNrColorInsert(mode)
--         " Insert mode: blue
--         if a:mode == "i"
--             call VSCodeNotify('nvim-theme.insert')
--
--         " Replace mode: red
--         elseif a:mode == "r"
--             call VSCodeNotify('nvim-theme.replace')
--         endif
--     endfunction
--
--     augroup CursorLineNrColorSwap
--         autocmd!
--         autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
--         autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
--         autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
--         autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
--         autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
--         autocmd ModeChanged [vV\x16]*:* call VSCodeNotify('nvim-theme.normal')
--     augroup END
-- ]], false)

--设置系统剪切板和 neovim 剪切板同步
vim.opt.clipboard = "unnamedplus"

local code = require('vscode')

-- 键盘映射

-- flash
map({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump() <CR>", { desc = "Flash" })
map({ "n", "x", "o" }, "S", "<CMD>lua require('flash').treesitter() <CR>", { desc = "Flash Treesitter" })

--移动
map({ "n", "v" }, "J", "<C-d>")
map({ "n", "v" }, "K", "<C-u>")
map({ "n" }, "L", "$")
map({ "n" }, "H", "^")
