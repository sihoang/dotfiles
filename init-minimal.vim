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

" Exit to normal mode
inoremap jj <ESC>

" Save extra shift
nnoremap ; :

" Unsets the last search pattern register by hitting <C-l>
nnoremap <silent> <C-l> :nohlsearch<CR>

