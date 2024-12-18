local cmp = require("cmp")
local luasnip = require("luasnip")
local suggestion = require("copilot.suggestion")
local copilot = require("copilot")

local function create_cmp_mapping(key)
  return cmp.mapping(function(fallback)
    if cmp.visible() and not cmp.get_selected_entry() then
      -- 使用 count 来选择相应的提示项
      cmp.select_next_item()
      cmp.select_next_item({ count = key - 1 })
      cmp.confirm({ select = true })
    else
      fallback()
    end
  end, { "i", "s" })
end

local cmp_mappings = {}
for i = 1, 9 do
  cmp_mappings[i] = create_cmp_mapping(i)
end

M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "L3MON4D3/LuaSnip",
      "copilot.lua",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "rasulomaroff/cmp-bufname",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "nvim-treesitter/nvim-treesitter",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-cmdline",
    },
    opts = {
      preselect = cmp.PreselectMode.None,
      completion = { completeopt = "menu,menuone,noselect" },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "wiki" },
        { name = "wikitags" },
        { name = "copilot", group_index = 2 },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "bufname" },
        { name = "path" },
        { name = "treesitter" },
        { name = "doxygen" },
      }),
      mapping = {
        ["<CR>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) and not cmp.get_selected_entry() then
            luasnip.jump(1)
          elseif cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif suggestion.is_visible() then
            suggestion.accept_word()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          elseif cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          elseif cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        -- 合并 1-9 数字键映射
        ["<D-1>"] = cmp_mappings[1],
        ["<D-2>"] = cmp_mappings[2],
        ["<D-3>"] = cmp_mappings[3],
        ["<D-4>"] = cmp_mappings[4],
        ["<D-5>"] = cmp_mappings[5],
        ["<D-6>"] = cmp_mappings[6],
        ["<D-7>"] = cmp_mappings[7],
        ["<D-8>"] = cmp_mappings[8],
        ["<D-9>"] = cmp_mappings[9],

      },
      view = {
        entries = "custom",
      },
    }
  }

return M
