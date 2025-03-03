local M = {
  "kawre/neotab.nvim",
  event = "InsertEnter",
  opts = {
    tabkey = "<Tab>",
    pairs = {
      { open = "(", close = ")" },
      { open = "[", close = "]" },
      { open = "{", close = "}" },
      { open = "'", close = "'" },
      { open = '"', close = '"' },
      { open = "`", close = "`" },
      { open = "<", close = ">" },
      { open = "$", close = "$" },
      { open = ",", close = "," },
    },
  },
}

return M
