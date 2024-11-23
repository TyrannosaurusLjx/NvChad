return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- 禁用自动选择第一个候选项
      opts.preselect = cmp.PreselectMode.None
      opts.completion = { completeopt = "menu,menuone,noselect" }
      -- 自定义按键映射
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) and not cmp.get_selected_entry() then
            luasnip.jump(1)
          elseif cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          -- elseif has_words_before() then
          --   cmp.complete()
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