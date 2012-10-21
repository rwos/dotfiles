set encoding=utf8
" whitespace
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nowrap
" user interface
set mouse=a
set listchars=tab:>-,trail:X
syntax on
set display=uhex
set nu
set ruler
set noerrorbells

set spell spelllang=en_us
set nospell

filetype on
filetype plugin on

" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl 'www.vim.org/scripts/download_script.php?src_id=16224' \
" > ~/.vim/autoload/pathogen.vim
call pathogen#infect() 

autocmd filetype scheme,racket setlocal tabstop=2
autocmd filetype scheme,racket setlocal shiftwidth=2
autocmd filetype scheme,racket setlocal autoindent
autocmd filetype scheme,racket setlocal lisp

