" plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')


""""""
""" View/Layout
""""""

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" Just one NERDTree, always and ever.
" It will always look the same in all tabs, including expanded/collapsed nodes, scroll position etc.
Plug 'jistr/vim-nerdtree-tabs'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" This is the official theme repository for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Adaptation of one-light and one-dark colorschemes for Vim
Plug 'rakr/vim-one'

" This adds syntax for nerdtree on most common file extensions.
" This is intended to be used with vim-devicons to add color to icons or
" entire labels, but will work without it.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
" Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'yggdroot/indentline'

" Better whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'


""""""
""" Operation Helpers i.e. search, git, session...
""""""

" Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.
" http://ctrlpvim.github.com/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" Vim plugin for the Perl module / CLI script 'ack'
" Need the silver search 'ag'
Plug 'mileszs/ack.vim'

" abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" A command-line fuzzy finder
" brew install fzf
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" rhubarb.vim: GitHub extension for fugitive.vim
" Enables :Gbrowse from fugitive.vim to open GitHub URLs.
Plug 'tpope/vim-rhubarb'

" Extended session management for Vim (:mksession on steroids) http://peterodding.com/code/vim/session/
Plug 'xolox/vim-session'

" Changes Vim working directory to project root (identified by presence of known directory or file).
Plug 'airblade/vim-rooter'


""""""
""" Faster coder
""""""

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" True Sublime Text style multiple selections for Vim.
Plug 'terryma/vim-multiple-cursors'

" Vim plugin for intensely orgasmic commenting.
Plug 'scrooloose/nerdcommenter'

" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" unimpaired.vim: pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" emmet-vim is a vim plug-in which provides support for expanding
" abbreviations similar to emmet.
Plug 'mattn/emmet-vim'


"""""""
""" Language Syntax
"""""""

" Go development plugin for Vim
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Vim syntax file for solidity
"Plug 'tomlion/vim-solidity'

" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing.
"Plug 'elzr/vim-json'

" Vastly improved Javascript indentation and syntax support in Vim.
"Plug 'pangloss/vim-javascript'

" React JSX syntax highlighting and indenting for vim.
" javascript -> javascript.jsx
"Plug 'mxw/vim-jsx'

" Typescript syntax files for Vim
"Plug 'leafgarland/typescript-vim'

" Basic vim/terraform integration
"Plug 'hashivim/vim-terraform'

"""""""
""" Language Formatters and Utils
"""""""

" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim
" 0.2.0+ and Vim 8 while you edit your text files.
"Plug 'w0rp/ale'

" Provides database access to many dbms (Oracle, Sybase, Microsoft, MySQL, DBI,..)
"Plug 'vim-scripts/dbext.vim'

" codefmt is a utility for syntax-aware code formatting. It contains several
" built-in formatters, and allows new formatters to be registered by other
" plugins.
" Required vim-maktaba and vim-glaive
"Plug 'sihoang/vim-codefmt'

" Language Server Protocol (LSP) support for vim and neovim.
" Need to install the language server separately
"Plug 'autozimu/LanguageClient-neovim', {
"  \ 'branch': 'next',
"  \ 'do': 'bash install.sh',
"  \ }

" The ultimate snippet solution for Vim.
"Plug 'sirver/ultisnips'

" This repository contains snippets files for various programming languages.
" Used with snippet engine which is sirver/ultisnips
"Plug 'honza/vim-snippets'

" Dark powered asynchronous completion framework for neovim/Vim8
"Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Include/Import/Require/Load... completion framework for neocomplete/deoplete
"Plug 'shougo/neoinclude.vim'

" Vim plugin for ImportJS
" Need to install importjs
"Plug 'galooshi/vim-import-js'


""""""
""" Behind the scene tools and/or dependencies
""""""

" Miscellaneous auto-load Vim scripts http://peterodding.com/code/vim/misc/
Plug 'xolox/vim-misc'

" Consistent Vimscript
"Plug 'google/vim-maktaba'

" Used to configure codefmt's maktaba flags. See :help Glaive
"Plug 'google/vim-glaive'

" Easy note taking in Vim
Plug 'xolox/vim-notes'


"""""""
""" Redundancy
"""""""

""" Use language server instead

" Yet Another TypeScript Syntax The most advanced TypeScript Syntax
" Highlighting in Vim
" Plug 'HerringtonDarkholme/yats.vim'

" YAJS.vim: Yet Another JavaScript Syntax for Vim
" Plug 'othree/yajs.vim'

" Typescript tooling for Neovim
" Plug 'mhartington/nvim-typescript'

"""

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""""""
""" Native Configs
""""""
set nu
" Don't want to spam the clipboard
" use "+ y/p
" set clipboard+=unnamedplus
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

set termguicolors


"""""""
""" Vim General Mapping
"""""""

" Remap leader key
let mapleader = ','

" Exit to normal mode
inoremap jj <ESC>

" Save extra shift
nnoremap ; :

" This unsets the last search pattern register by hitting <C-l>
if maparg('<C-l>', 'n') ==# ''
  nnoremap <silent> <C-l> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>
endif

map <C-s> :wincmd w<CR>


"""""""
""" Plugin Configs
"""""""

"""""""
""" View/Layout
"""""""

" vim-airline
let g:airline_powerline_fonts = 1
let g:one_allow_italics = 1
set background=dark
colorscheme one


" ryanoasis/vim-devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1


" scrooloose/nerdtree
autocmd vimenter * NERDTree | wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
map <C-h> :NERDTreeToggle<CR>


" ntpeters/vim-better-whitespace
let g:better_whitespace_enabled=1


"""""""
""" Operation Helpers
"""""""

" mileszs/ack.vim
" Use silver search
let g:ackprg = 'ag --vimgrep'
" Remap ack
nnoremap <Leader>a :Ack


" airblade/vim-rooter
" Before searching directories, manually call rooter
let g:rooter_manual_only = 1


" xolox/vim-session
" Annoying confirm every exit
let g:session_autosave = 'no'


"""""""
""" Faster coder
"""""""

" easymotion/vim-easymotion
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


" scrooloose/nerdcommenter
" Add spaces after comment delimiters
let g:NERDSpaceDelims=1


" mattn/emmet-vim
let g:user_emmet_settings = {
  \ 'javascript.jsx' : {
  \   'extends' : 'jsx',
  \ },
  \ }


"""""""
""" Lanuage Syntax
"""""""

" elzr/vim-json
" fix yggdroot/indentline bug in JSON files
" https://github.com/Yggdroot/indentLine/issues/140#issuecomment-173867054
let g:vim_json_syntax_conceal = 0

" fatih/vim-go
" Use this option to jump to an existing buffer for the split, vsplit and tab
" mappings of |:GoDef|. By default it's disabled.
let g:go_def_reuse_buffer = 1

" gofmt + goimports on save
" https://github.com/fatih/vim-go/issues/207
let g:go_fmt_command = "goimports"

" disable the default `gd` mapping to use the go-def-vertical
let g:go_def_mapping_enabled = 0
au Filetype go nmap gd <Plug>(go-def-vertical)

" hashivim/vim-terraform
let g:terraform_fmt_on_save=1

"""""""
""" Language Formatters and Utils
"""""""

" shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1


" shougo/neoinclude.vim
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


" w0rp/ale
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


" sihoang/codefmt
" custom codefmt with prettier
autocmd Filetype html,json,typescript,javascript,jsx,javascript.jsx let b:codefmt_formatter = 'prettier'


" sirver/ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-k>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = "vertical"

" Snippet directories
let g:UltiSnipsSnippetDirectories=[$HOME.'/.local/share/nvim/plugged/vim-snippets/UltiSnips']


" autozimu/LanguageClient-neovim
" Require https://github.com/sourcegraph/javascript-typescript-langserver
let g:LanguageClient_serverCommands = {
  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio'],
  \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>


""""""
""" Behind the scene tools and/or dependencies
""""""
let g:notes_directories = ['~/SyncMobile/private-notes']
let g:notes_suffix = '.md'

