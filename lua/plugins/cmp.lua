return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local suggestion = require("copilot.suggestion")
      --------------------
      -- local custom_source = require('nvimwiki.cmp')
      -- cmp.register_source('month', custom_source.new())
      ----------------------
      -- 禁用自动选择第一个候选项
      opts.preselect = cmp.PreselectMode.None
      opts.completion = { completeopt = "menu,menuone,noselect" }
      -- 自定义按键映射
      opts.sources = {
        { name = 'wiki' },
        { name = "copilot", group_index = 2 },
        -- { name = 'mdlink' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'emoji' },
        { name = 'treesitter' },
        -- { name = 'spell' },
      }
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
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
          -- elseif has_words_before() then
          --   cmp.complete()
            --- copilot
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-Tab>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          elseif cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
    
  },
}
