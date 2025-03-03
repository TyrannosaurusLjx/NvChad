M = {
  "folke/edgy.nvim",
  enabled = false,
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    left = {
      -- Buffers 窗口（上方 25% 高度）
      {
        title = "NeoTree Buffers",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "buffers"
        end,
        pinned = true, -- 固定窗口位置
        open = "Neotree position=left buffers", -- 强制指定源为 buffers
        -- size = { height = 0.25 },
      },
      -- Filesystem 窗口（下方 65% 高度）
      {
        title = "NeoTree Filesystem",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        pinned = true, -- 固定窗口位置
        open = "Neotree position=left filesystem", -- 强制指定源为 filesystem
        -- size = { height = 0.65 },
      },
      {
        title = "Neo-Tree Git",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "git_status"
        end,
        pinned = false,
        collapsed = true, -- show window as closed/collapsed on start

        size = { height = 0.10 },
        open = "Neotree position=right git_status",
      },
      {
        title = "OUTLINE",
        ft = "Outline",
        size = { width = 0.25, height = 0.4 },
      },
      {
        title = "NvimTree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "buffers"
        end,
        size = { width = 0.20 },
      },
    },
    bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
      {
        ft = "toggleterm",
        size = { height = 0.4 },
        -- exclude floating windows
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      {
        ft = "lazyterm",
        title = "LazyTerm",
        size = { height = 0.4 },
        filter = function(buf)
          return not vim.b[buf].lazyterm_cmd
        end,
      },
      "Trouble",
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      { ft = "spectre_panel", size = { height = 0.4 } },
      {
        title = "nvterm",
        ft = "NvTerm_vsp",
        size = { width = 0.25 },
      },
      {
        title = "Trouble",
        ft = "Trouble",
        size = { height = 0.10 },
      },
    },
    right = {
      {
        title = "sagaOutLine",
        ft = "sagaoutline",
        size = { width = 0.25 },
      },
      {
        title = "Copilot",
        ft = "copilot-chat",
        size = { width = 0.25 },
      },
    },
    wo = {
      -- Setting to `true`, will add an edgy winbar.
      -- Setting to `false`, won't set any winbar.
      -- Setting to a string, will set the winbar to that string.
      winbar = true,
      winfixwidth = true,
      winfixheight = true,
      winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
      spell = false,
      signcolumn = "no",
    },
  },
}

return M
