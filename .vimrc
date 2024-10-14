" 命令模式
nnoremap ; :

" 插入模式
inoremap jk <ESC>

" buffer 管理
nnoremap <D-w> :lua require('bufdelete').bufdelete(0, true)<CR>

" 切换到 buffer
for i in range(1, 9)
  execute "nnoremap <D-" . i . "> :lua vim.api.nvim_set_current_buf(vim.t.bufs[" . i . "])<CR>"
endfor

" 切换到下一个/上一个 buffer
nnoremap <D-]> :bnext<CR>
nnoremap <D-[> :bprevious<CR>
nnoremap <D-}> :tabNext<CR>
nnoremap <D-{> :tabprevious<CR>
nnoremap <tab> jzz

" markdown 插件
nnoremap <leader>mp :call mdip#MarkdownClipboardImage()<CR>

" Aerial 插件
nnoremap <D-a> :AerialToggle<CR>

" 文件搜索
nnoremap <D-F> :Telescope live_grep<CR>
nnoremap <D-E> :Telescope find_files<CR>
nnoremap <D-f> :Telescope current_buffer_fuzzy_find<CR>

" 取消搜索高亮
nnoremap // :nohl<CR>

" 插入模式匹配
inoremap <D-n> <C-p>

" 向后删除
inoremap <D-backspace> <Right><backspace>

" 插入模式下一行
inoremap <D-enter> <ESC>o

" 撤销和重做
nnoremap U <C-r>
nnoremap <D-z> u
nnoremap <D-Z> <C-r>

" 注释
nnoremap <leader-/> :lua require("Comment.api").toggle.linewise.current()<CR>
vnoremap <leader-/> <ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>

" flash 插件
nnoremap s :lua require('flash').jump()<CR>
nnoremap S :lua require('flash').treesitter()<CR>

" 窗口管理
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <D-h> <C-w>h
nnoremap <D-j> <C-w>j
nnoremap <D-k> <C-w>k
nnoremap <D-l> <C-w>l

" 文件预览和 trouble
nnoremap <D-e> :NvimTreeToggle<CR>
nnoremap <D-p> :lua require('goto-preview').goto_preview_definition()<CR>

" 复制粘贴
vnoremap <D-c> "+y
inoremap <D-v> <C-r>+

" terminal 管理
nnoremap <D-t> :lua require("nvchad.term").toggle { pos = "float", size = 0.3 }<CR>
nnoremap <C-`> :lua require("nvchad.term").toggle { pos = "sp", size = 0.25 }<CR>

" 隐藏终端
tnoremap <ESC> <C-\><C-N>

" 帮助
nnoremap ? :edit ~/.config/nvim/Tutor/surround.txt<CR>

" 重命名
nnoremap <leader>rn :IncRename <C-r><C-w><CR>
