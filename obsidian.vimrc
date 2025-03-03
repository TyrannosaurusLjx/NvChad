unmap <Space>

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
nmap J 5j
nmap K 5k
" I like using H and L for beginning/end of line
nmap H ^
nmap L $
vmap H ^
vmap L $

" Yank to system clipboard
set clipboard=unnamed

" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold<CR>
nmap zc :togglefold<CR>
nmap za :togglefold<CR>

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall<CR>

exmap foldall obcommand editor:fold-all
nmap zM :foldall<CR>

exmap tabnext obcommand workspace:next-tab
nmap gt :tabnext<CR>
exmap tabprev obcommand workspace:previous-tab
nmap gT :tabprev<CR>

exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki<CR>
nunmap s
vunmap s
map s" :surround_double_quotes<CR>
map s' :surround_single_quotes<CR>
map s` :surround_backticks<CR>
map sb :surround_brackets<CR>
map s( :surround_brackets<CR>
map s) :surround_brackets<CR>
map s[ :surround_square_brackets<CR>
map s[ :surround_square_brackets<CR>
map s{ :surround_curly_brackets<CR>
map s} :surround_curly_brackets<CR>


" Maps pasteinto to Alt-p
map <C-p> :pasteinto<CR>

imap jk <Esc>

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back<CR>
exmap forward obcommand app:go-forward
nmap <C-i> :forward<CR>

" window controls
exmap wq obcommand workspace:close
exmap q obcommand workspace:close

exmap focusRight obcommand editor:focus-right
nmap <C-w>l :focusRight<CR>

exmap focusLeft obcommand editor:focus-left
nmap <C-w>h :focusLeft<CR>

exmap focusTop obcommand editor:focus-top
nmap <C-w>k :focusTop<CR>

exmap focusBottom obcommand editor:focus-bottom
nmap <C-w>j :focusBottom<CR>

exmap splitVertical obcommand workspace:split-vertical
nmap <C-w>v :splitVertical<CR>

exmap splitHorizontal obcommand workspace:split-horizontal
nmap <C-w>s :splitHorizontal<CR>


