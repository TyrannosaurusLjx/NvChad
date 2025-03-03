local cmdline = {
  "hrsh7th/cmp-cmdline",
  event = "CmdlineEnter",
  config = function()
    local cmp = require "cmp"
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
  end,
}

local luaset = {
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
}

local cmpconf = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    cmdline,
    "uga-rosa/cmp-dictionary",
    "hrsh7th/cmp-nvim-lsp-signature-help",
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
  },
  opts = function(_, opts)
    local lspkind = require "lspkind"
    local cmp = require "cmp"
    local luasnip = require "luasnip"
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
        -- elseif luasnip.expandable() then
        --   luasnip.expand()
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

      ["?"] = cmp.mapping(function(fallback)
        if cmp.open_docs() then
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
      { name = "nvim_lsp_signature_help" },
    }
    --
    -- local formatting = {
    --   fields = { "kind", "abbr", "menu" },
    --   format = function(entry, vim_item)
    --     local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
    --     local strings = vim.split(kind.kind, "%s", { trimempty = true })
    --     kind.kind = " " .. (strings[1] or "") .. " "
    --     kind.menu = "    (" .. (strings[2] or "") .. ")"
    --     return kind
    --   end,
    -- }

    local view = {
      docs = { auto_open = false },
      entries = "custom",
    }
    opts.sources = sources
    opts.mapping = mappings
    opts.view = view
    -- opts.formatting = formatting
  end,
}
return { cmpconf, luaset }
