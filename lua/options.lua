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


