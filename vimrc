" Vundle setup and initialisation (required)
set nocompatible              " be iMproved, required
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sensible'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

filetype plugin indent on
syntax on

set mousehide					    " Hide the mouse when typing text

" Set up a custom leader, so we actually use it
let mapleader=","
let maplocalleader=";"

set smartindent                 		" Determine the correct tab level
set tabstop=4					" Set tab stops to be more manageable
set shiftwidth=4				" Set autoindent width to 4
set expandtab 					" Don't use tabs, use spaces instead
set smarttab					" Turn on smart tabbing
set switchbuf=usetab,newtab     " re-use a tab/window otherwise open a new taib
set nowrap

set showmode
set number
set pastetoggle=<F2>

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>

" Map control-backspace to delete previous word
imap <C-BS> <C-W>

" Bind nohl
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" leader-i to go import under cursor
au Filetype go nnoremap <buffer> <leader>i :exe 'GoImport ' . expand('<cword>')<CR>

" Go run open file
au Filetype go nnoremap <leader>r :GoRun %<CR>

" Go to def
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

" Custom status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

colorscheme Tomorrow-Night

if exists('+colorcolumn')
    au FileType python setlocal colorcolumn=80
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

let g:go_fmt_command = "goimports"

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
