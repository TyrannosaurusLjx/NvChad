local M = {
  {
    "williamboman/mason.nvim",
    lazy = false, -- 确保 mason.nvim 在启动时加载
    dependencies = { "jay-babu/mason-nvim-dap.nvim" },
    config = function()
      require("mason").setup {
        ensure_installed = {
          "pyright",
          "debugpy",
        },
      } -- 配置 mason 本身
      require("mason-nvim-dap").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false, -- 确保 mason-lspconfig 在启动时加载
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "pyright", "ltex", "pylsp", "markdown_oxide" }, -- 安装并确保这些 LSP 存在
        automatic_installation = true, -- 自动安装未安装的 LSP
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
}

require "configs.lspconfig"
return M
