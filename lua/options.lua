require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- vim.o.guifont = "Hack Nerd Font:h18:#h-none"
-- vim.o.guifont = "Lekton Nerd Font Mono:h20:#h-none"
vim.o.guifont = "JetBrainsMono Nerd Font:h18:#h-none"
-- vim.o.guifont = "NotoSerif Nerd Font Propo:h18:#h-none"

if vim.g.neovide then
	-- vim.g.neovide_text_gamma = 0.7
	-- vim.g.neovide_text_contrast = 1.0
	vim.g.neovide_window_blurred = false
	vim.g.neovide_show_border = false
	vim.g.experimental_layer_grouping = false
	vim.g.neovide_input_macos_option_key_is_meta = "both"
	vim.g.neovide_input_ime = true
	vim.g.neovide_cursor_animation_length = 0.1
	vim.g.neovide_transparency = 1.0
	vim.g.neovide_cursor_trail_size = 0.1
	vim.g.neovide_floating_corner_radius = 0.5 --浮动窗口的圆角值  0-1, 越大越圆
end

--------------------自定义的一些常量
vim.g.pythonPath = "/opt/homebrew/anaconda3/envs/ml/bin/python" --python 路径

--------------------
--avante.lua
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

vim.g.gruvbox_material_foreground = "mix"

vim.g.sonokai_style = "maia"

----bufferline 设置
vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,skiprtp"

--侧边行号
vim.opt.number = true
--相对行号
vim.opt.relativenumber = true
---tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.o.ignorecase = true -- 忽略大小写
vim.o.infercase = true -- 根据输入推断大小写

---md-preview
vim.g.mkdp_browser = "safari"
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_theme = "dark"

---mdd 语法高亮
-- vim.g.markdown_fenced_languages = {'python', 'cpp'}
--

-----https://github.com/brenoprata10/nvim-highlight-colors
vim.opt.termguicolors = true

---cursor blink
vim.o.guicursor = table.concat({
	"n-v-c:block-Cursor/lCursor-blinkwait1-blinkon600-blinkoff500",
	"i-ci:ver25-Cursor/lCursor-blinkwait1-blinkon600-blinkoff500",
	"r:hor50-Cursor/lCursor-blinkwait1-blinkon600-blinkoff400",
}, ",")

-- Hide deprecation warnings
vim.g.deprecation_warnings = false
-- Show the current document symbols location from Trouble in lualine
-- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
vim.g.trouble_lualine = true

-----pop item max number
vim.opt.pumheight = 12
vim.opt.pumwidth = 50 -- 设置补全菜单最小宽度为 50 列

-- 设置保存撤销记录的目录
vim.opt.undodir = vim.fn.expand("~/temp/undodir")
-- 启用持久撤销
vim.opt.undofile = true

-------edge theme setting
vim.g.edge_style = "neon"
vim.g.edge_inlay_hints_background = "dimmed"
vim.g.edge_better_performance = 1
vim.g.edge_dim_foreground = 1
vim.g.edge_disable_italic_coment = 0
vim.g.edge_enable_italic = 1
vim.g.edge_cursor = "auto"
vim.g.edge_menu_selection_background = "blue"
vim.g.edge_spell_foreground = "colored"
vim.g.edge_float_style = "bright"
vim.g.edge_diagnostic_virtual_text = "grey"

-------------mkdnflow
vim.wo.conceallevel = 2

--------------符号列
vim.wo.signcolumn = "number"

vim.g.magma_automatically_open_output = 1

--------------折叠
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
