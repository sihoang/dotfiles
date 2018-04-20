" plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'

Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/nvim-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'

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
map <C-j> :tabp<CR>
map <C-k> :tabn<CR>

" Theme
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
let NERDTreeDirArrows=1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
map <C-h> :NERDTreeToggle<CR>

" Extra spaces
let NERDSpaceDelims=1

" Use silver search
let g:ackprg = 'ag --vimgrep'

" Autocomplete
let g:deoplete#enable_at_startup = 1

" Lint fix
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tslint']
  \ }
nmap <leader>d <Plug>(ale_fix)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map Ml <Plug>(easymotion-bd-jk)
nmap Ml <Plug>(easymotion-overwin-line)

" Move current line up/down
map <A-UP> :m-2<CR>
map <A-DOWN> :m+1<CR>

