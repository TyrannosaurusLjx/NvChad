-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "everforest",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- Add the following in your custom/configs/overrides.lua file. You can configure copilot to meet your needs here.
-- M.copilot = {
--   -- Possible configurable fields can be found on:
--   -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
--   suggestion = {
--     enable = false,
--   },
--   panel = {
--     enable = false,
--   },
--   filetypes = {
--     yaml = true,
--     markdown = true,
--     help = false,
--     gitcommit = false,
--     gitrebase = false,
--     hgcommit = false,
--     svn = false,
--     cvs = false,
--     ["."] = false,
--   },
-- }

--重写 

M.ui = {
  nvdash = {
    load_on_startup = false,
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  cmp = {
      style = "atom_colored",
      mapping = (function()
          local cmp = require("cmp")
          local luasnip = require("luasnip")
          return {
              ['<CR>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      if luasnip.expandable() then
                          luasnip.expand()
                      else
                          cmp.confirm({
                              select = true,
                          })
                      end
                  else
                      fallback()
                  end
              end),

              ['<Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      cmp.select_next_item()
                  elseif luasnip.locally_jumpable(1) then
                    luasnip.jump(1)
                  else
                      fallback()
                  end
              end, { "i","s"}),

              ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      cmp.select_prev_item()
                  elseif luasnip.locally_jumpable(-1) then
                      luasnip.jump(-1)
                  else
                      fallback()
                  end
              end,{"i", "s"}),

              sources = {
              name = "nvim_lsp",
            }
          }
      end),
  },

  telescope = { 
    style = "bordered",
    extensions = {
      workspaces = {
        -- keep insert mode after selection in the picker, default is false
        keep_insert = true,
        -- Highlight group used for the path in the picker, default is "String"
        path_hl = "String"
      }
    }

  },

  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    order = nil,
    modules = nil,
  },

  tabufline = {
    modules = {
      abc = function ()
        return "hi"
      end
    }

  }


}




return M
