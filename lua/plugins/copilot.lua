return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "BufReadPre", "InsertEnter" },
    -- lazy = false,
    config = function()
      require("copilot").setup({
        panel = { enabled = false },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<C-a>",
            accept_word = "<C-w>",
            next = "<C-n>",
            prev = "<C-p>",
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = true,
          gitcommit = true,
          gitrebase = true,
          hgcommit = true,
          svn = true,
          cvs = true,
          ["."] = true,
        },
      })
    end,
  },
}
