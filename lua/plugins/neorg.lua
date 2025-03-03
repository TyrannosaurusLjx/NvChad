local M = {
  enabled = false,
  "nvim-neorg/neorg",
  ft = "norg",
  -- build = ":Neorg sync-parsers", -- and delete this line.
  cmd = "Neorg",
}
local modules = {
  ["core.defaults"] = {},
  ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
  ["core.integrations.nvim-cmp"] = {},
  ["core.concealer"] = { config = { icon_preset = "diamond" } },
  ["core.keybinds"] = {
    -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
    config = {
      default_keybinds = true,
      neorg_leader = "<Leader><Leader>",
    },
  },
  ["core.dirman"] = {
    config = {
      workspaces = {
        Notes = "~/neorgs/",
      },
    },
  },
}
M.opts = {
  load = modules,
}
return M
