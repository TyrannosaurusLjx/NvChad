local filetype = { "markdown", "md", "rmd", "latex" }
M = {
  {
    "OXY2DEV/markview.nvim",
    -- lazy = false,
    enabled = true,
    -- event = "VeryLazy",
    ft = { "md", "markdown", "latex", "tex" }, -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local presets = require "markview.presets"

      require("markview").setup {
        markdown = {
          headings = presets.headings.slanted,
        },
      }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    ft = filetype,
    after = { "nvim-treesitter" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    config = function()
      require("render-markdown").setup {
        -- heading = { border = true, border_virtual = false },
      }
    end,
  },
  -- {
  --  "neovim/nvim-lspconfig",
  --   config = function ()
  --     -- An example nvim-lspconfig capabilities setting
  --     local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  --     require"lspconfig".markdown_oxide.setup({
  --         -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
  --         -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
  --         capabilities = vim.tbl_deep_extend(
  --             'force',
  --             capabilities,
  --             {
  --                 workspace = {
  --                     didChangeWatchedFiles = {
  --                         dynamicRegistration = true,
  --                     },
  --                 },
  --             }
  --         ),
  --         on_attach = on_attach -- configure your on attach config
  --     })
  --   end,
  -- },
  {
    "jakewvincent/mkdnflow.nvim",
    ft = filetype,
    config = function()
      require("mkdnflow").setup {
        links = {
          style = "wiki",
          name_is_source = false,
          conceal = false,
          context = 0,
          implicit_extension = nil,
          transform_implicit = false,
          transform_explicit = function(text)
            text = text:gsub(" ", "_")
            text = text:lower()
            -- text = os.date('%Y-%m-%d_')..text
            return text
          end,
          create_on_follow_failure = true,
        },
        mappings = {
          MkdnEnter = { { "n", "v" }, "<CR>" },
          MkdnTab = false,
          MkdnSTab = false,
          MkdnNextLink = { "n", "<Tab>" },
          MkdnPrevLink = { "n", "<S-Tab>" },
          MkdnNextHeading = { "n", "]h" },
          MkdnPrevHeading = { "n", "[h" },
          MkdnGoBack = { "n", "[[" },
          MkdnGoForward = { "n", "]]" },
          MkdnCreateLink = false, -- see MkdnEnter
          MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>p" }, -- see MkdnEnter
          MkdnFollowLink = false, -- see MkdnEnter
          MkdnDestroyLink = { "n", "<M-CR>" },
          MkdnTagSpan = { "v", "<M-CR>" },
          MkdnMoveSource = { "n", "<F2>" },
          MkdnYankAnchorLink = { "n", "yaa" },
          MkdnYankFileAnchorLink = { "n", "yfa" },
          MkdnIncreaseHeading = { "n", "+" },
          MkdnDecreaseHeading = { "n", "-" },
          MkdnToggleToDo = { { "n", "v" }, "<C-Space>" },
          MkdnNewListItem = false,
          MkdnNewListItemBelowInsert = { "n", "o" },
          MkdnNewListItemAboveInsert = { "n", "O" },
          MkdnExtendList = false,
          MkdnUpdateNumbering = { "n", "<leader>nn" },
          MkdnTableNextCell = { "i", "<Tab>" },
          MkdnTablePrevCell = { "i", "<S-Tab>" },
          MkdnTableNextRow = false,
          MkdnTablePrevRow = { "i", "<M-CR>" },
          MkdnTableNewRowBelow = { "n", "<leader>ir" },
          MkdnTableNewRowAbove = { "n", "<leader>iR" },
          MkdnTableNewColAfter = { "n", "<leader>ic" },
          MkdnTableNewColBefore = { "n", "<leader>iC" },
          MkdnFoldSection = { "n", "<leader>f" },
          MkdnUnfoldSection = { "n", "<leader>F" },
        },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    -- enabled = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = filetype,
    build = ":call mkdp#util#install()",
  },
  {
    "img-paste-devs/img-paste.vim",
    ft = filetype,
    event = "VeryLazy",
  },
  --   {
  --     "jubnzv/mdeval.nvim",
  --     config = function ()
  --       require 'mdeval'.setup({
  --         -- Don't ask before executing code blocks
  --         require_confirmation=false,
  --         eval_options = {
  --           python = {
  --             command = {"python3"},
  --             default_header = [[
  -- import sys
  -- import os
  -- import numpy as np
  -- import matplotlib.pyplot as plt
  -- import pandas as pd
  -- import scipy as sp
  --             ]]
  --           },
  --         },
  --       })
  --     end
  --   }

  {
    "michaelb/sniprun",
    enabled = false,
    build = "sh ./install.sh",
  },
}

local map = vim.keymap.set

return M
