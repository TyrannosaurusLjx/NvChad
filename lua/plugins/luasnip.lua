return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    --filetype
    ft = { "lua", "markdown", "md" },
    config = function()
      -- 加载自定义 VS Code 代码片段
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { vim.fn.expand("~/.config/nvim/snippets/") },
      })
    end,
  },
}
