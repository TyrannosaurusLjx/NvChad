return {
  {
    "OXY2DEV/markview.nvim",
    lazy = true,      -- Recommended
    -- enabled = false,
    event = "VeryLazy",
    ft = { "markdown", "md", "rmd", "latex" }, -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local presets = require("markview.presets").headings
      require("markview").setup({
        hybrid_modes = { "n", "i" }, -- 光标到这里就会变成源代码
        modes = { "n" },

        -- 标题
        -- https://github.com/OXY2DEV/markview.nvim/wiki/Headings
        -- headings = {
        --   -- enable = true,
        --   -- shift_width = 1,
        --   heading_1 = MD_HEADING_STYLE_1,
        --   heading_2 = MD_HEADING_STYLE_2,
        --   heading_3 = MD_HEADING_STYLE_3,
        --   heading_4 = MD_HEADING_STYLE_4,
        --   heading_5 = MD_HEADING_STYLE_5,
        -- },
        headings = presets.arrowed,
      })
    end,
  },
}
