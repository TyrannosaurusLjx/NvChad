-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  integrations = {
    "markview",
  },
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }

M.ui = {
  tabufline = {
    enabled = true,
    order = { "neo_tree", "treeOffset", "buffers" },
    modules = {
      neo_tree = function()
        local api = vim.api
        local strep = string.rep
        local function getNeoTreeWidth()
          for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
            if vim.bo[api.nvim_win_get_buf(win)].ft == "neo-tree" then
              return api.nvim_win_get_width(win)
            end
          end
          return 0
        end
        local w = getNeoTreeWidth()
        return w == 0 and "" or "%#NeoTreeNormal#" .. strep("=", w) .. "%#NeoTreeWinSeparator#" .. "│"
      end,
    },
  },

  statusline = {
    enabled = true,
  },
  cmp = {
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = true,
    },
  },
}

return M
