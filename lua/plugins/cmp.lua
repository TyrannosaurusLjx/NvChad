return{
{
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ['<C-Tab>'] = require("cmp").mapping(function(fallback)
          local cmp = require "cmp"
          local luasnip = require("luasnip")
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          elseif cmp.visible() then
              cmp.select_next_item()
          else
              fallback()
          end
        end, { "i","s"}),
      },
    },
  }
}
