local M = {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    version = "v2.*",
    build = "make install_jsregexp",
    lazy = false,
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/snippets" },
      }
      require("luasnip").config.setup { history = true }
    end,
  },
  {
    "uga-rosa/cmp-dictionary",
    config = function()
      require("cmp_dictionary").setup {
        paths = { vim.fn.expand "~/.config/nvim/dictionary" },
        exact_length = 2,
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "uga-rosa/cmp-dictionary",
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
    opts = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local lspkind = require "lspkind"

      -- 按键映射配置
      local mappings = {
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm { select = true }
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif luasnip.expandable() then
            luasnip.expand()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<D-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<D-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<D-l>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<D-h>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }

      -- 添加数字键映射
      for i = 1, 9 do
        mappings["<D-" .. i .. ">"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            cmp.select_next_item { count = i }
            cmp.confirm { select = true }
          else
            fallback()
          end
        end, { "i", "s" })
      end

      -- 补全源配置
      local sources = {
        { name = "luasnip" },
        -- { name = "dictionary", keyword_length = 3 },
        { name = "wikitest" },
        {
          name = "nvim_lsp",
          priority = 1,
          group_index = 1,
          option = { markdown_oxide = { keyword_pattern = [[\(\k\| \|\/\|#\)\+]] } },
        },
        { name = "bufname" },
        { name = "path" },
        { name = "treesitter" },
      }

      -- 命令行补全配置
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
        view = {
          entries = { name = "wildmenu", separator = "|" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        completion = { completeopt = "menu,menuone,noselect" },
        matching = "ignore_case",
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      })

      local lspkind_comparator = function(conf)
        local lsp_types = require("cmp.types").lsp
        return function(entry1, entry2)
          if entry1.source.name ~= "nvim_lsp" then
            if entry2.source.name == "nvim_lsp" then
              return false
            else
              return nil
            end
          end
          local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
          local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

          local priority1 = conf.kind_priority[kind1] or 0
          local priority2 = conf.kind_priority[kind2] or 0
          if priority1 == priority2 then
            return nil
          end
          return priority2 < priority1
        end
      end

      local label_comparator = function(entry1, entry2)
        return entry1.completion_item.label < entry2.completion_item.label
      end

      ---------------自定义高亮
      -- Customization for Pmenu
      -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
      -- vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
      -- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
      -- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
      -- vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })
      --
      -- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
      -- vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
      -------------------------

      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = mappings,
        sources = sources,
        preselect = cmp.PreselectMode.Item,
        completion = {
          completeopt = "menu,menuone",
        },
        view = {
          docs = { auto_open = true },
          entries = "custom",
        },
        comparators = {
          lspkind_comparator {
            kind_priority = {
              Field = 11,
              Property = 11,
              Constant = 10,
              Enum = 10,
              EnumMember = 10,
              Event = 10,
              Function = 10,
              Method = 10,
              Operator = 10,
              Reference = 10,
              Struct = 10,
              Variable = 9,
              File = 8,
              Folder = 8,
              Class = 5,
              Color = 5,
              Module = 5,
              Keyword = 2,
              Constructor = 1,
              Interface = 1,
              Snippet = 0,
              Text = 1,
              TypeParameter = 1,
              Unit = 1,
              Value = 1,
            },
          },
          label_comparator,
        },
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"

            return kind
          end,
        },

        -- formatting = {
        -- 	format = lspkind.cmp_format({
        -- 		mode = "symbol_text", -- show only symbol annotation
        -- 		maxwidth = {
        -- 			-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- 			-- can also be a function to dynamically calculate max width such as
        -- 			-- menu = function() return math.floor(0.45 * vim.o.columns) end,
        -- 			menu = 50, -- leading text (labelDetails)
        -- 			abbr = 50, -- actual suggestion item
        -- 		},
        -- 		ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        -- 		show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        --
        -- 		-- The function below will be called before any actual modifications from lspkind
        -- 		-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        -- 		before = function(entry, vim_item)
        -- 			return vim_item
        -- 		end,
        -- 	}),
        -- },
        -- window = {
        -- 	completion = {
        -- 		border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        -- 		winhighlight = "Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        -- 	},
        -- 	documentation = {
        -- 		border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        -- 		winhighlight = "Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        -- 	},
        -- },
      }
    end,
  },
}

return M
