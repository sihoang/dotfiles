" Minimal vim/nvim
" ~/.vimrc
" ~/.config/nvim/init.vim

set nu
syntax on

" Load indentation rules and plugins
" according to the detected filetype
filetype plugin indent on

" Highlight all search matches
set hlsearch

" Incremental search
set incsearch

" Number of space characters that will be inserted
" when the tab key is pressed
set tabstop=2

" Number of space characters inserted for indentation
" also used by = < > commands
set shiftwidth=2

" On pressing tab, insert 2 spaces
" Use Ctrl-V<Tab> for a real tab character
set expandtab

" Automatic word wrapping
set tw=80

" Use soft wrap which does not change the text
" but simply displays it on multiple lines
set wrap linebreak nolist

" Exit to normal mode
inoremap jj <ESC>

" Save extra shift
nnoremap ; :

" Unsets the last search pattern register by hitting <C-l>
nnoremap <silent> <C-l> :nohlsearch<CR>


" Netrw
" Set list style to tree which can be expanded/collapsed
" Hit i to cycle through list style
let g:netrw_liststyle = 3

" Hide banner
let g:netrw_banner = 0

" Maximum width of the tree
let g:netrw_winsize = 17

" Open files in the previous window
let g:netrw_browse_split = 4

" Show the dir tree
nnoremap <silent> <C-h> :Vexplore<CR>
