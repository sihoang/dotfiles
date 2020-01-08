" v2
" IDE with Lean Settings
"

" plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

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

" Vim plugin for the Perl module / CLI script 'ack'
" Need the silver search 'ag'
Plug 'mileszs/ack.vim'

" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim
" 0.2.0+ and Vim 8 while you edit your text files.
Plug 'dense-analysis/ale'

" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Typescript syntax files for Vim
Plug 'leafgarland/typescript-vim'

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

" Automatic word wrapping
set tw=80

" Use soft wrap which does not change the text
" but simply displays it on multiple lines
set wrap linebreak nolist

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


" mileszs/ack.vim 
" Use silver search
let g:ackprg = 'ag --nogroup --nocolor --column'
" Shortcut ack. ! prevents jumping to first result.
nnoremap <Leader>a :Ack!


" dense-analysis/ale
let g:ale_lint_on_text_changed = 'never' " save battery
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
" Make sure these bin are in the $PATH
let g:ale_fixers = {
  \ '*': ['prettier'],
  \ 'javascript': ['eslint'],
  \ }
let g:ale_linters = {
  \ 'solidity': ['solium'],
  \ }
" Do not lint or fix minified files
" go is handled by vim-go
let g:ale_pattern_options = {
  \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
  \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
  \ '\.go$': {'ale_linters': [], 'ale_fixers': []},
  \}
nmap <Leader>d <Plug>(ale_fix)


" leafgarland/typescript-vim
" Set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
" Let dense-analysis/ale do the formatting
let g:typescript_indent_disable = 1

" fatih/vim-go
" gofmt + goimports on save
" https://github.com/fatih/vim-go/issues/207
let g:go_fmt_command = "goimports"
" Disable the default `gd` mapping to use the go-def-vertical
let g:go_def_mapping_enabled = 0
au Filetype go nmap gd <Plug>(go-def-vertical)
