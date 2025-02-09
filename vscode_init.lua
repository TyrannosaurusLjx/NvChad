vim.g.mapleader = " " -- 设置leader键
vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"

local map = vim.keymap.set -- 设置键盘映射

--设置 lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- local lazy_config = require "configs.lazy"

-- 在这里继续添加其他插件和配置
require("lazy").setup({
	-- Tree-sitter
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	run = ":TSUpdate", -- 运行 TS 更新
	-- 	config = function()
	-- 		require("nvim-treesitter.configs").setup({
	-- 			auto_install = true,
	-- 			ensure_installed = { "c", "lua", "python", "javascript", "html", "css", "cpp" }, -- 你需要的语言
	-- 			highlight = {
	-- 				enable = true, -- 开启高亮
	-- 				additional_vim_regex_highlighting = false, -- 关闭额外的 regex 高亮
	-- 			},
	-- 			-- 添加其他 Tree-sitter 配置...
	-- 		})
	-- 	end,
	-- },


  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    -- opts = {
    --   ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python"},
    --   -- Install parsers synchronously (only applied to `ensure_installed`)
    --   sync_install = true,
    --
    --   -- Automatically install missing parsers when entering buffer
    --   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    --   auto_install = true,
    --   highlight = {
    --     enable = true,
    --     additional_vim_regex_highlighting = true,  -- 禁用 vim 的正则高亮（可以提高性能）
    --   },
    -- }
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufRead",
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = false, -- Enable multiwindow support.
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = true,
    after = "nvim-treesitter",
    config = function()
      local opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python"},
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = true,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        highlight = { enable = true },
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
              -- You can choose the select mode (default is charwise 'v')
              --
              -- Can also be a function which gets passed a table with the keys
              -- * query_string: eg '@function.inner'
              -- * method: eg 'v' or 'o'
              -- and should return the mode ('v', 'V', or '<c-v>') or a table
              -- mapping query_strings to modes.
              selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
              },
              -- If you set this to `true` (default is `false`) then any textobject is
              -- extended to include preceding or succeeding whitespace. Succeeding
              -- whitespace has priority in order to act similarly to eg the built-in
              -- `ap`.
              --
              -- Can also be a function which gets passed a table with the keys
              -- * query_string: eg '@function.inner'
              -- * selection_mode: eg 'v'
              -- and should return true or false
              include_surrounding_whitespace = true,
            },
            swap = {
              enable = true,
              swap_next = {
                ["<leader>a"] = "@parameter.inner",
              },
              swap_previous = {
                ["<leader>A"] = "@parameter.inner",
              },
            },
          },
      }
      require"nvim-treesitter.configs".setup(opts)
    end
  }

	-- surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- telescope
	-- {
	--   'nvim-telescope/telescope.nvim',
	--   tag = '0.1.8',
	--   dependencies = { 'nvim-lua/plenary.nvim' },
	-- },

	-- flash
	{
		"folke/flash.nvim",
		-- event = "VeryLazy",
		opts = {},
	},
	-- {
	--   "rainzm/flash-zh.nvim",
	--   event = "VeryLazy",
	--   dependencies = "folke/flash.nvim",
	--   keys = {{
	--       "s",
	--       mode = {"n", "x", "o"},
	--       function()
	--           require("flash-zh").jump({
	--               chinese_only = false
	--           })
	--       end,
	--       desc = "Flash between Chinese"
	--   }}
	-- },
	--
})

--- neovim-ui
-- vim.cmd([[
--     " THEME CHANGER
--     function! SetCursorLineNrColorInsert(mode)
--         " Insert mode: blue
--         if a:mode == "i"
--             call VSCodeNotify('nvim-theme.insert')
--
--         " Replace mode: red
--         elseif a:mode == "r"
--             call VSCodeNotify('nvim-theme.replace')
--         endif
--     endfunction
--
--     augroup CursorLineNrColorSwap
--         autocmd!
--         autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
--         autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
--         autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
--         autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
--         autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
--         autocmd ModeChanged [vV\x16]*:* call VSCodeNotify('nvim-theme.normal')
--     augroup END
-- ]], false)

--设置系统剪切板和 neovim 剪切板同步
vim.opt.clipboard = "unnamedplus"

local code = require("vscode")

-- 键盘映射

-- flash
map({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump() <CR>", { desc = "Flash" })
map({ "n", "x", "o" }, "S", "<CMD>lua require('flash').treesitter() <CR>", { desc = "Flash Treesitter" })

--移动
map({ "n", "v" }, "J", "<C-d>")
map({ "n", "v" }, "K", "<C-u>")
map({ "n" }, "L", "$")
map({ "n" }, "H", "^")
