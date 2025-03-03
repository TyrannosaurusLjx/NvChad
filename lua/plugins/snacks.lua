local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = false },
    dashboard = {
      enabled = true,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center

      pane_gap = 10, -- empty columns between vertical panes
      autokeys = "1234abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      preset = {
        header = [[
 __     __  ______   ______                 __          
|  \   |  \/      \ /      \               |  \         
| ▓▓   | ▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ______   ____| ▓▓ ______  
| ▓▓   | ▓▓ ▓▓___\▓▓ ▓▓   \▓▓/      \ /      ▓▓/      \ 
 \▓▓\ /  ▓▓\▓▓    \| ▓▓     |  ▓▓▓▓▓▓\  ▓▓▓▓▓▓▓  ▓▓▓▓▓▓\
  \▓▓\  ▓▓ _\▓▓▓▓▓▓\ ▓▓   __| ▓▓  | ▓▓ ▓▓  | ▓▓ ▓▓    ▓▓
   \▓▓ ▓▓ |  \__| ▓▓ ▓▓__/  \ ▓▓__/ ▓▓ ▓▓__| ▓▓ ▓▓▓▓▓▓▓▓
    \▓▓▓   \▓▓    ▓▓\▓▓    ▓▓\▓▓    ▓▓\▓▓    ▓▓\▓▓     \
     \▓     \▓▓▓▓▓▓  \▓▓▓▓▓▓  \▓▓▓▓▓▓  \▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓


𝓔𝓿𝓮𝓻𝔂𝓽𝓱𝓲𝓷𝓰 𝓱𝓪𝓼 𝓪 𝓫𝓮𝓰𝓲𝓷𝓷𝓲𝓷𝓰, 𝓫𝓾𝓽 𝓯𝓮𝔀 𝓱𝓪𝓿𝓮 𝓪𝓷 𝓮𝓷𝓭

          ]],
        keys = {
          {
            icon = "𝕱 ",
            key = "f",
            desc = "Find Journal",
            action = ":lua require'telescope.builtin'.find_files({cwd = '~/wiki'})",
          },
          { icon = "𝖙 ", key = "t", desc = "Today Journal", action = ":lua Journal(0)" },
          {
            icon = "𝕾 ",
            key = "S",
            desc = "Recent Sessions",
            action = ":lua require('persistence').select()",
          },
          {
            icon = "𝖗 ",
            key = "r",
            desc = "Recent Files",
            action = ":Telescope oldfiles",
          },
          {
            icon = "𝖈 ",
            key = "c",
            desc = "Config",
            action = ":lua require'telescope.builtin'.find_files({cwd = '~/.config/nvim'})",
          },
          {
            icon = "𝖘 ",
            key = "s",
            desc = "Restore Session",
            action = ":SessionRestore",
          },
          {
            icon = "𝕷 ",
            key = "L",
            desc = "Lazy",
            action = ":Lazy",
            enabled = package.loaded.lazy ~= nil,
          },
          { icon = "𝖖 ", key = "q", desc = "Quit", action = ":qa" },
        },
      },

      sections = {
        { title = "", section = "header", pane = 1 },
        { title = "RecentFiles", section = "recent_files", pane = 3, padding = 2, limit = 15 },
        { title = "QuickStart", section = "keys", padding = 4, pane = 2 },
        { title = "Projects", section = "projects", padding = 5, pane = 4 },
        { title = "StatrUp", section = "startup", pane = 4 },
      },
    },

    picker = {
      enabled = true,
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    image = { enabled = not vim.g.neovide },
  },
}

return M
