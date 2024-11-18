vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"


-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "treesitter")
dofile(vim.g.base46_cache .. "markview")

require "options"
require "nvchad.autocmds"
-- require "more" -- 我其他的配置

vim.schedule(function()
  require "mappings"
end)



-- 预配置
vim.cmd [[
  " set guifont=Hack\ Nerd\ Font\ Mono:h16
  "set guifont=JetBrains\ Mono:h16
  "set guifont=Hack\ Nerd\ Font:h15
  "set guifont=Hack\ Nerd\ Font\ Mono:w0:h16:#e-antialias:#h-full
  set scrolloff=15
  Copilot suggestion
  NvimTreeResize 20
]]


vim.g.copilot_filetypes = {markdown = true}


