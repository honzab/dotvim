" Vundle setup and initialisation (required)
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "tpope/vim-markdown"
Bundle "tsaleh/vim-supertab"
Bundle "jnwhiteh/vim-golang"
Bundle "vim-scripts/wombat256.vim"
Bundle "vim-scripts/IndexedSearch"
Bundle "vim-scripts/Gist.vim"
Bundle "bronson/vim-trailing-whitespace"
Bundle "vim-scripts/The-NERD-tree"
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-sensible"
Bundle "bling/vim-airline"
Bundle "scrooloose/syntastic"
Bundle "rodjek/vim-puppet"

filetype plugin indent on
syntax on

set mousehide					    " Hide the mouse when typing text

" Setup swapfile and backup file storage/rules
silent execute '!mkdir -p "' . $HOME . '/.vimswapfiles"'
silent execute '!mkdir -p "' . $HOME . '/.vimbackups"'
set nobackup
set directory=$HOME/.vimswapfiles/
set backupdir=$HOME/.vimbackups/

" Set up a custom leader, so we actually use it
let mapleader=","
let maplocalleader=";"

set smartindent                 		" Determine the correct tab level
set tabstop=4					" Set tab stops to be more manageable
set shiftwidth=4				" Set autoindent width to 4
set expandtab 					" Don't use tabs, use spaces instead
set smarttab					" Turn on smart tabbing
set switchbuf=usetab,newtab     " re-use a tab/window otherwise open a new taib

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

" Autocommand rules for a few common files
au BufNewFile,BufRead *.txt,*.html,README,*.tex setlocal spell
au BufNewFile,BufRead wscript set filetype=python

au FileType text setlocal textwidth=78
au FileType markdown setlocal ai formatoptions+=cqrt comments=n:&gt;
au FileType lua setlocal nu si tabstop=4 ruler laststatus=2 showmode noexpandtab formatoptions-=t textwidth=78 formatoptions+=c
au FileType go setlocal nu si tabstop=4 ruler laststatus=2 showmode noexpandtab formatoptions-=t textwidth=78 formatoptions+=c
au FileType go setlocal makeprg=go\ install\ %:h
au FileType go autocmd BufWritePre <buffer> Fmt
au FileType lua setlocal nu si tabstop=4 ruler laststatus=2 showmode noexpandtab formatoptions-=t textwidth=78 formatoptions+=c
au FileType erlang let g:erlangCompiler="erlc"

set showmode
set number
set pastetoggle=<F2>

" Change to the current file's directory
command -nargs=0 Cd cd %:p:h

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \   if &omnifunc == "" |
    \     setlocal omnifunc=syntaxcomplete#Complete |
    \   endif
endif

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

" Custom status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Jump to last file position when reloading
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

set t_Co=256
colorscheme wombat256mod

if exists('+colorcolumn')
    au FileType python setlocal colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
