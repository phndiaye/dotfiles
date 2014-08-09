" ====== [ Common settings ] ======

" Disable Vi compatibility
set nocompatible

" Always deal with utf-8 encoded characters
set encoding=utf-8
set termencoding=utf-8

set t_Co=256
if !has('gui_running')
  set term=color_xterm
end
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
set noswapfile
set nobackup
set history=1000

" Never use any kind of bell, visual or not
set visualbell t_vb=

" Customize the status line
set statusline=                                 " Override default
set statusline+=\ %f\ %m\ %r                    " Show filename/path
set statusline+=%=                              " Set right-side status info after this line
set statusline+=%l/%L:%v                        " Set <line number>/<total lines>:<column>
set statusline+=\                               " Set ending space

" Ignore compiled files, image files, plus some
" temporary/caching files when fuzzy searching file
set wildmenu
set wildmode=longest:full,full
set wildignore=*.a,*.o,*.exe
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.sw?,*.tmp

" Highlight matched pairs characters
set showmatch
set matchpairs+=<:>
set matchtime=2

" Enable filetype support and turn on syntax highlighting
filetype on
filetype indent on
filetype plugin on
syntax on

if has('gui_running')
  set guioptions=aAi
  set guifont=Monaco:h11
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

" Show invisible characters (useful to avoid trailing spaces for example)
set list
set listchars=trail:·

" Do not assume a number with a leading zero is an octal and
" let incrementation/decrementation (^A / ^X) behave as usual.
set nrformats-=octal

" ====== [ Bundles Management ] ======
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand("~/.vim/bundle/"))

NeoBundleFetch 'Shougo/neobundle.vim'

" Productivity booster
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'mattn/emmet-vim'

" Colorschemes
NeoBundle 'tomasr/molokai'

" Syntax highlighters
NeoBundle 'sheerun/vim-polyglot'

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

" ====== [ Configure Plugins ] ======

" Vim Emmet
let g:user_emmet_mode='a'


" ====== [ Key binding ] ======
nmap <silent> <C-n> :silent noh<CR>

" Quick save, quitting, (both), quitting all
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
