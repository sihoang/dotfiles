" plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'sihoang/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
Plug 'mattn/emmet-vim'

Plug 'ervandew/supertab'
Plug 'yggdroot/indentline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'galooshi/vim-import-js'
Plug 'tomlion/vim-solidity'
Plug 'w0rp/ale'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/neoinclude.vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhartington/nvim-typescript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Redundant
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'othree/yajs.vim'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set nu
set clipboard+=unnamedplus
autocmd BufEnter * silent! lcd %:p:h
set tabstop=2
set shiftwidth=2
set expandtab " On pressing tab, insert 2 spaces

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Remap leader key
let mapleader = ','

" Exit to normal mode
inoremap jj <ESC>

" Save extra shift
nnoremap ; :

" Always show at least x lines above/below the cursor.
if !&scrolloff
  set scrolloff=8
endif
if !&sidescrolloff
  set sidescrolloff=8
endif
set display+=lastline

set incsearch

" This unsets the last search pattern register by hitting <C-l>
if maparg('<C-l>', 'n') ==# ''
  nnoremap <silent> <C-l> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>
endif

map <C-s> :wincmd w<CR>

" Theme
let g:airline_powerline_fonts = 1
let g:one_allow_italics = 1

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
colorscheme one

autocmd vimenter * NERDTree | wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
map <C-h> :NERDTreeToggle<CR>

" Add spaces after comment delimiters
let g:NERDSpaceDelims=1

" Use silver search
let g:ackprg = 'ag --vimgrep'

" Remap ack
nnoremap <Leader>a :Ack

" Autocomplete
let g:deoplete#enable_at_startup = 1

" Lint fix
let g:ale_lint_on_text_changed = 'never' " save battery
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tslint'],
  \ }
let g:ale_linters = {
  \ 'solidity': ['solium'],
  \ }
nmap <Leader>d <Plug>(ale_fix)

" custom codefmt with prettier
autocmd Filetype html,json,typescript,javascript,jsx,javascript.jsx let b:codefmt_formatter = 'prettier'

" Move to word
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to {char}
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Searn n chars
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" https://github.com/Yggdroot/indentLine/issues/140#issuecomment-173867054
let g:vim_json_syntax_conceal = 0

" Before searching directories, manually call rooter
let g:rooter_manual_only = 1

let g:user_emmet_settings = {
  \ 'javascript.jsx' : {
  \   'extends' : 'jsx',
  \ },
  \ }

" Ignore javascript file extensions
let g:neoinclude#exts = {
  \ 'typescript': ['ts', 'tsx'],
  \ 'javascript': ['js', 'jsx'],
  \ }

let g:neoinclude#patterns = {
  \ 'typescript': '^\s*\<\%(import\)\>',
  \ 'javascript.jsx': '\<\%(require\|import\)\>',
  \ }

let g:neoinclude#reverse_exprs = {
  \ 'typescript': 'substitute(v:fname, "\.{ts|tsx}$", "", "")',
  \ 'javascript.jsx': 'substitute(v:fname, "\.{js|jsx}$", "", "")',
  \ }

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-k>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = "vertical"

" Snippet directories
let g:UltiSnipsSnippetDirectories=[$HOME.'/.local/share/nvim/plugged/vim-snippets/UltiSnips']
