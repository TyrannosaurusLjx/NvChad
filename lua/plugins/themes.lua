if true then
  return {}
end
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rebelot/kanagawa.nvim" },
  {
    "sainnhe/edge",
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup {
        palettes = {
          all = {
            white = {
              -- base = "#ABB2BF",
              bright = "#ABB2BF",
              -- dim = "#ABB2BF"
            },
          },
          nordfox = {
            white = "#ABB2BF",
            bg0 = "#22242B", --  -- Alt backgrounds (floats, statusline, ...)
            bg1 = "#292C33", -- Black background
            bg3 = "#333842", -- 55% darkened from stock
          },
        },
        options = {
          transparent = false,
          dim_inactive = false,
          styles = {
            comments = "italic", -- Value is any valid attr-list value `:help attr-list`
            functions = "bold",
            keywords = "italic",
            numbers = "bold",
            types = "bold",
            variables = "italic",
          },
        },
      }
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup {
        colors = {
          onedark = { bg = "#282C34" },
        }, -- Override default colors or create your own
        highlights = {
          Cursor = { fg = "NONE", bg = "#FFC600" }, -- 光标高亮
          lCursor = { fg = "NONE", bg = "#FFC600" }, -- GUI 光标高亮
          CursorInsert = { fg = "NONE", bg = "#FFC600" }, -- 插入模式光标
          ------- neotree
          NeoTreeNormal = { fg = "#FFC600", bg = "#21252B" }, --neotree 背景颜色
          NeoTreeNormalNC = { fg = "#FFC600", bg = "#21252B" }, --neoTree 非活动文件夹背景颜色
          NeoTreeEndOfBuffer = { fg = "#FFC600", bg = "#272C35" },
          NeoTreeDirectoryIcon = { fg = "#0277BD", bg = "NONE" }, --neotree 文件夹图标颜色
          NeoTreeDirectoryName = { fg = "#ABB2BF", bg = "NONE" }, --neotree 文件夹名颜色
          NeoTreeFileName = { fg = "#ABB2BF", bg = "NONE" }, --neotree 文件名颜色
          NeoTreeDimText = { fg = "#626B78", bg = "NONE" }, --neotree 非活动文件夹颜色
          NeoTreeFileIcon = { fg = "#90A4AE", bg = "NONE" }, --neotree 文件图标颜色
          ------- python
          ["@function.builtin"] = { fg = "#61AFEE", style = "NONE" },
          ["@variable.python"] = { fg = "#78A2C4", style = "NONE" },

          ------- lualine
          LualineMode = { fg = "#FFC600", bg = "#282C34" },
        }, -- Override default highlight groups or create your own
        styles = { -- For example, to apply bold and italic, use "bold,italic"
          types = "bold", -- Style that is applied to types
          methods = "italic", -- Style that is applied to methods
          numbers = "bold", -- Style that is applied to numbers
          strings = "NONE", -- Style that is applied to strings
          comments = "italic", -- Style that is applied to comments
          keywords = "bold", -- Style that is applied to keywords
          constants = "NONE", -- Style that is applied to constants
          functions = "bold", -- Style that is applied to functions
          operators = "NONE", -- Style that is applied to operators
          variables = "NONE", -- Style that is applied to variables
          parameters = "italic", -- Style that is applied to parameters
          conditionals = "NONE", -- Style that is applied to conditionals
          virtual_text = "italic", -- Style that is applied to virtual text
        },
        options = {
          cursorline = true, -- Use cursorline highlighting?
          transparency = false, -- Use a transparent background?
          -- terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
          lualine_transparency = false, -- Center bar transparency?
          highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
        },
      }
    end,
  },
  { "neanias/everforest-nvim" },
  { "tiagovla/tokyodark.nvim" },
  {
    "andrew-george/telescope-themes",
    config = function()
      require("telescope").load_extension "themes"
    end,
  },
}
