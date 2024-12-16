return {
  {
    dir = "~/nvimwiki",
    -- lazy = true,
    ft = { "markdown", "md", },
    dependencies = {
      "nvim-lua/plenary.nvim", -- 声明依赖 plenary.nvim
      "kkharji/sqlite.lua",
      "akinsho/bufferline.nvim",
      "nvim-telescope/telescope.nvim",

    },
    config = function()
      require("nvimwiki").setup()
    end,
  },
}

-- return{
--   {
--     "TyrannosaurusLjx/wiki.nvim",
--     -- lazy = true,
--     ft = { "markdown", "md", },
--     dependencies = {
--       "nvim-lua/plenary.nvim", -- 声明依赖 plenary.nvim
--       "kkharji/sqlite.lua",
--       "akinsho/bufferline.nvim"
--     },
--     config = function ()
--       require("nvimwiki").setup()
--     end
--   }
-- }
