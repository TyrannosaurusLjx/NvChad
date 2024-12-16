return {
    {
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
        "onsails/lspkind.nvim", -- 修改样式
        "hrsh7th/cmp-cmdline",

      },
      config = function ()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local suggestion = require("copilot.suggestion")
      local lspkind = require("lspkind")
          cmp.setup({
            preselect = cmp.PreselectMode.None,
            completion = { completeopt = "menu,menuone,noselect" },

            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },

            -- 配置候选源
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

            -- 自定义按键映射
            mapping = cmp.mapping.preset.insert({
              ["<CR>"] = cmp.mapping(function(fallback)
                if luasnip.locally_jumpable(1) and not cmp.get_selected_entry() then
                  luasnip.jump(1)
                elseif cmp.visible() and cmp.get_selected_entry() then
                  cmp.confirm({ select = true })
                elseif vim.snippet.active({ direction = 1 }) then
                  vim.schedule(function()
                    vim.snippet.jump(1)
                  end)
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
                elseif vim.snippet.active({ direction = 1 }) then
                  vim.schedule(function()
                    vim.snippet.jump(1)
                  end)
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
            }),

            -- 视图设置
            view = {
              entries = "custom",
            },

            -- 可选：lspkind 图标支持
            -- formatting = {
            --   format = require("lspkind").cmp_format(),
            -- },
          })
            -- 为 `/` 和 `?` 命令行模式设置补全
            cmp.setup.cmdline({ "/", "?" }, {
              mapping = cmp.mapping.preset.cmdline(),
              sources = {
                { name = "buffer" }, -- 搜索当前缓冲区内容
              },
              view = {
                entries = {name = 'wildmenu', separator = '|' }
              }, 
            })

            -- 为 `:` 命令行模式设置补全
            cmp.setup.cmdline(":", {
              mapping = cmp.mapping.preset.cmdline(),
              sources = cmp.config.sources({
                { name = "path" },     -- 文件路径补全
              }, {
                { name = "cmdline" },  -- 命令补全
              }),
            })

            cmp.setup {
              formatting = {
                format = lspkind.cmp_format({
                  mode = 'symbol_text', -- show only symbol annotations
                  maxwidth = {
                    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    -- can also be a function to dynamically calculate max width such as
                    -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                    menu = 20, -- leading text (labelDetails)
                    abbr = 30, -- actual suggestion item
                  },
                  ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                  show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                  -- The function below will be called before any actual modifications from lspkind
                  -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                  before = function (entry, vim_item)
                    -- ...
                    return vim_item
      end
    })
  }
}

          end
  }
}
