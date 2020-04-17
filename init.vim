" v2
" IDE with Lean Settings
"

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" Adaptation of one-light and one-dark colorschemes for Vim
" Refer to the Plugin Configs section
Plug 'rakr/vim-one'

" A tree explorer plugin for vim.
Plug 'preservim/nerdtree'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'yggdroot/indentline'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Vim plugin for the Perl module / CLI script 'ack'
" Need the silver search 'ag'
Plug 'mileszs/ack.vim'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim
" 0.2.0+ and Vim 8 while you edit your text files.
Plug 'dense-analysis/ale'

" Typescript syntax files for Vim
Plug 'leafgarland/typescript-vim'

" Syntax highlighting for Dart in Vim
Plug 'dart-lang/dart-vim-plugin'

" A vim plugin for communicating with a language server
Plug 'natebosch/vim-lsc'

" vim-lsc server configuration for the Dart language
Plug 'natebosch/vim-lsc-dart'

" deoplete source for vim-lsc
Plug 'sihoang/deoplete-vim-lsc'

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

" Avoid suppressing error messages from plugins
set shortmess-=F

" Close the preview window after completion is done
autocmd CompleteDone * silent! pclose!

"""""""
""" Plugin Configs
"""""""

" vim-airline
let g:airline_powerline_fonts = 1


" rakr/vim-one
let g:one_allow_italics = 1
set background=dark
colorscheme one


" preservim/nerdtree
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


" leafgarland/typescript-vim
" Set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.ts,*.js,*.tsx,*.jsx set filetype=typescript.tsx
" Let dense-analysis/ale do the formatting
let g:typescript_indent_disable = 1


" dense-analysis/ale
" Save battery
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
" Let natebosch/vim-lsc handle lsp
let g:ale_disable_lsp = 1
" Make sure these bin are in the $PATH
let g:ale_fixers = {
  \ '*': ['prettier'],
  \ 'typescript.tsx': ['eslint'],
  \ 'dart': ['dartfmt'],
  \ 'go': ['goimports'],
  \ }
let g:ale_linters = {
  \ 'typescript.tsx': ['eslint'],
  \ 'solidity': ['solium'],
  \ }
" Do not lint or fix minified files
let g:ale_pattern_options = {
  \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
  \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
  \ }
let g:ale_javascript_prettier_use_local_config = 1


" dart-lang/dart-vim-plugin
let dart_html_in_string = v:true


" natebosch/vim-lsc
let g:lsc_server_commands = {
  \ 'dart': 'dart_language_server',
  \ 'go': {
  \   'command': 'gopls serve',
  \   'log_level': -1,
  \   'suppress_stderr': v:true,
  \ },
  \ 'typescript.tsx': {
  \   'command': 'typescript-language-server --stdio',
  \   'log_level': -1,
  \   'suppress_stderr': v:true,
  \ },
  \ }

" Complete mappings are:
let g:lsc_auto_map = {
  \ 'GoToDefinition': '<C-]>',
  \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
  \ 'FindReferences': 'gr',
  \ 'NextReference': '<C-n>',
  \ 'PreviousReference': '<C-p>',
  \ 'FindImplementations': 'gI',
  \ 'FindCodeActions': 'ga',
  \ 'Rename': 'gR',
  \ 'ShowHover': v:true,
  \ 'DocumentSymbol': 'go',
  \ 'WorkspaceSymbol': 'gS',
  \ 'SignatureHelp': 'gm',
  \ 'Completion': 'completefunc',
  \ }
