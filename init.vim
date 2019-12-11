" v2
" IDE with Lean Settings
"

" plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" This is the official theme repository for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Adaptation of one-light and one-dark colorschemes for Vim
" Refer to the Plugin Configs section
Plug 'rakr/vim-one'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'yggdroot/indentline'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim
" 0.2.0+ and Vim 8 while you edit your text files.
Plug 'dense-analysis/ale'

" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


""""""
""" Native Configs
""""""

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

" Uncomment if terminal supports true color
" Test: printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
" If TRUECOLOR appears in RED then the terminal supports true color
set termguicolors

" Remap leader key
let mapleader = ','

" Exit to normal mode
inoremap jj <ESC>

" Save extra shift
nnoremap ; :

" Unsets the last search pattern register by hitting <C-l>
nnoremap <silent> <C-l> :nohlsearch<CR>

" Make sure Ctr-s is not conflicted with the Software Control Flow
" If it freezes, hit Ctr-q to resume
nnoremap <C-s> :wincmd w<CR>


"""""""
""" Plugin Configs
"""""""

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'


" rakr/vim-one
let g:one_allow_italics = 1
set background=dark
colorscheme one


" scrooloose/nerdtree
autocmd vimenter * NERDTree | wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
map <C-h> :NERDTreeToggle<CR>


" yggdroot/indentline
let g:indentLine_concealcursor = ''


" shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1


" dense-analysis/ale
let g:ale_lint_on_text_changed = 'never' " save battery
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
" Make sure these bin are in the $PATH
let g:ale_fixers = {
  \ '*': ['prettier'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tslint'],
  \ }
let g:ale_linters = {
  \ 'solidity': ['solium'],
  \ }
nmap <Leader>d <Plug>(ale_fix)


" fatih/vim-go
" gofmt + goimports on save
" https://github.com/fatih/vim-go/issues/207
let g:go_fmt_command = "goimports"

" Disable the default `gd` mapping to use the go-def-vertical
let g:go_def_mapping_enabled = 0
au Filetype go nmap gd <Plug>(go-def-vertical)
