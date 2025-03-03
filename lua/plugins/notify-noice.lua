local M = {

  {
    "rcarriga/nvim-notify",
    enabled = true,

    opts = { render = "compact" },
  },
  {
    "folke/noice.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        progress = {
          enabled = true,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = false,
          auto_open = {
            enabled = false,
            trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50, -- Debounce lsp signature help request by 50ms
          },
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      cmdline = {
        view = "cmdline",
        format = {
          cmdline = { icon = ">" },
          search_down = { icon = "🔎⌄" },
          search_up = { icon = "🔍⌃" },
          filter = { icon = "$" },
          lua = { icon = "☾" },
          help = { icon = "⛏️" },
        },
      },
      format = {
        search_down = {
          view = "cmdline",
        },
        search_up = {
          view = "cmdline",
        },
        level = {
          icons = {
            error = "✖",
            warn = "▼",
            info = "●",
          },
        },
      },
      popupmenu = {
        kind_icons = true,
      },
      inc_rename = {
        cmdline = {
          format = {
            IncRename = { icon = "⟳" },
          },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
    },
  },
}

return M
