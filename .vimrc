" ====== [ Common settings ] ======
set nocompatible

set encoding=utf-8
set termencoding=utf-8

set lazyredraw
set showmode
set number
set ruler
set laststatus=2
set textwidth=80
set colorcolumn=+1
set splitbelow splitright
set clipboard=unnamed
set autoread
set nowrap
set nobackup
set noswapfile

set backspace=2
set backspace=indent,eol,start
fixdel

set wildmenu
set wildmode=longest:full,full
set wildignore=*.a,*.o,*.exe

" Highlight matched pairs characters
set showmatch
set matchpairs+=<:>
set matchtime=2

filetype on
filetype indent on
filetype plugin on
syntax on

if has('gui_running')
  set t_Co=256
  set guioptions=aAi
endif

" Rebind the leader key (The ',' key is always right under my finger)
let mapleader=","
let g:mapleader=","

" Enable mouse when Vim supports it.
if has('mouse')
  set mouse=a
endif

" Handle indentation
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Searching
set ignorecase smartcase
set hlsearch
set incsearch

" ====== [ Bundles Management ] ======
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand("~/.vim/bundle/"))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'tomasr/molokai'

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'groenewege/vim-less'
NeoBundleCheck

call neobundle#end()

colorscheme molokai

" ====== [ Automatic runnable tasks ] ======
if has('autocmd')
  autocmd BufEnter * :syntax enable
  autocmd Filetype html set sw=2 tabstop=2 softtabstop=2 relativenumber nowrap
  autocmd BufRead, BufNewFile *.html.erb set filetype=html
endif

" ====== [ VIM as a Python IDE ] ======
set wildignore+=*.pyc,**/__pycache__

" ====== [ Key binding ] ======
nmap <silent> <C-n> :silent noh<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>wq :wq<CR>
nmap <leader>qa :qa<CR>


" ====== [ Misc ] ======
" Autoreload .vimrc when there are changes on save.
augroup vimrcautoreload
  autocmd!
  autocmd! BufWritePost *.vimrc :source ~/.vimrc
augroup END
