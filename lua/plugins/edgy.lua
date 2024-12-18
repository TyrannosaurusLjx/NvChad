M = {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    left = {
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.7 },
      },
      {
        title = "NvimTree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "buffers"
        end,
        size = { height = 0.3 },
      },
    },
    bottom = {
      {
        title = "nvterm",
        ft = "NvTerm_vsp",
        size = { width = 0.25 },
      },
      {
        title = "Trouble",
        ft = "Trouble",
        size = { height = 0.15 },
      }
    },
    right = {
      {
        title = "OUTLINE",
        ft = "Outline",
        size = { width = 0.25 },
      },
    }
  }
}

return M
