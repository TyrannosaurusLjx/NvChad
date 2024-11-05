require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- auto_session
o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- undo file 
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'

--markdown
vim.g.mkdp_browser = 'safari'


vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 5 -- 过长的都折叠

vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = '/opt/homebrew/anaconda3/bin/python3'

-- neovide 设置
-- vim.g.neovide_show_border = true
vim.g.neovide_position_animation_length = 0.05
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_underline_stroke_scale = 1.0
vim.g.neovide_theme = 'auto'
vim.g.neovide_cursor_animation_length = 0.06
vim.g.neovide_cursor_trail_size = 0.1
vim.g.neovide_cursor_animate_command_line = true

-- 在除了输入模式外，关闭输入法(不能输入中文路径)
vim.g.neovide_input_ime = true
local function set_ime(args)
    if args.event:match("Enter$") then
        vim.g.neovide_input_ime = true
    else
        vim.g.neovide_input_ime = false
    end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime
})

