-- 这是把 copilot嵌入到 cmp 中的
-- local overrides = require("chadrc")
--
-- local plugins = {
--
--   -- ... all your other plugins ...
--    {
--     "zbirenbaum/copilot.lua",
--     event = "InsertEnter",
--     opts = overrides.copilot,
--   },
--
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       {
--         "zbirenbaum/copilot-cmp",
--         config = function()
--           require("copilot_cmp").setup()
--         end,
--       },
--     },
--     opts = {
--       sources = {
--         { name = "nvim_lsp", group_index = 2 },
--         { name = "copilot",  group_index = 2 },
--         { name = "luasnip",  group_index = 2 },
--         { name = "buffer",   group_index = 2 },
--         { name = "nvim_lua", group_index = 2 },
--         { name = "path",     group_index = 1 },
--       },
--     },
--   }
--
--
-- }
-- return plugins

return{
   {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = false,
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

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       config = function()
  --         require("copilot_cmp").setup()
  --       end,
  --     },
  --   },
  --   opts = {
  --     sources = {
  --       { name = "luasnip",  group_index = 2 },
  --       { name = "buffer",   group_index = 2 },
  --       { name = "nvim_lua", group_index = 2 },
  --       { name = "path",     group_index = 1 },
  --     },
  --   },
  -- }
}
