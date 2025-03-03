local M = {
  ----提供光标所在行的高亮, 和单词高亮
  {
    "ya2s/nvim-cursorline",
    opts = {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    },
  },
  {
    "max397574/better-escape.nvim",
    enabled = false,
    opts = {},
    -- config = function()
    --   require("better_escape").setup()
    -- end,
  },
}
return M
