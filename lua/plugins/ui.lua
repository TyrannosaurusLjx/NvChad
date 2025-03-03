M = {
  -- {
  -- 	"nvim-tree/nvim-tree.lua",
  -- 	enabled = false,
  -- 	config = function()
  -- 		require("neo-tree").setup({
  -- 			sources = {
  -- 				"filesystem",
  -- 				"buffers",
  -- 				"git_status",
  -- 			},
  -- 			add_blank_line_at_top = true,
  -- 			-- source_selector = {
  -- 			--     winbar = true,
  -- 			--     statusline = true
  -- 			-- },
  -- 			window = {
  -- 				mappings = {
  -- 					["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
  -- 				},
  -- 			},
  -- 		})
  -- 	end,
  -- },
  {
    "ramilito/winbar.nvim",
    enabled = false,
    event = "VimEnter", -- Alternatively, BufReadPre if we don't care about the empty file when starting with 'nvim'
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("winbar").setup {
        -- your configuration comes here, for example:
        icons = true,
        diagnostics = true,
        buf_modified = true,
        buf_modified_symbol = "M",
        filetype_exclude = {
          "help",
          "dashboard",
          "neo-tree",
          "NvimTree",
          "alpha",
          "Outline",
          "toggleterm",
          "snacks_dashboard",
        },
        -- or use an icon
        -- buf_modified_symbol = "●"
        dim_inactive = {
          enabled = false,
          highlight = "WinbarNC",
          icons = true, -- whether to dim the icons
          name = true, -- whether to dim the name
        },
      }
    end,
  },
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
      require("tiny-devicons-auto-colors").setup()
    end,
  },
  {
    "OXY2DEV/helpview.nvim",
    lazy = false, -- Recommended

    -- In case you still want to lazy load
    -- ft = "help",

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}

return M
