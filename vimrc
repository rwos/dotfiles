set encoding=utf8

" whitespace
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nowrap
set nojoinspaces
" user interface
set mouse=a
set listchars=tab:>-,trail:X
syntax on
set display=uhex
set nu
set ruler
set rulerformat=%30(%=\ %l,%c%V\ %P%)
set cursorline
set shortmess+=filmnrxoOtT
" no error bell
set noeb vb t_vb=
" color
set t_Co=256
set bg=dark
color rwos

set spell spelllang=en_us
set nospell

set autoread<

filetype on
filetype plugin on

" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl 'www.vim.org/scripts/download_script.php?src_id=16224' \
" > ~/.vim/autoload/pathogen.vim
call pathogen#infect() 

autocmd filetype scheme,guile,racket setlocal tabstop=2
autocmd filetype scheme,guile,racket setlocal shiftwidth=2
autocmd filetype scheme,guile,racket setlocal autoindent
autocmd filetype scheme,guile,racket setlocal lisp

autocmd filetype ruby,coffee,html setlocal tabstop=2
autocmd filetype ruby,coffee,html setlocal shiftwidth=2
autocmd filetype ruby,coffee,html setlocal autoindent

" auto complete on shift-tab
imap [Z <C-x><C-o>

" php stuff
imap <F12> <esc>iecho "<pre>";var_dump($);die;<ESC>?(<ENTER>ci($

" ruby stuff
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec	set filetype=ruby
au BufNewFile,BufRead *.builder,*.rxml,*.rjs		set filetype=ruby
au BufNewFile,BufRead [rR]akefile,*.rake		set filetype=ruby
au BufNewFile,BufRead [rR]antfile,*.rant		set filetype=ruby
au BufNewFile,BufRead .irbrc,irbrc			set filetype=ruby
au BufNewFile,BufRead .pryrc				set filetype=ruby
au BufNewFile,BufRead *.ru				set filetype=ruby
au BufNewFile,BufRead Capfile				set filetype=ruby
au BufNewFile,BufRead Gemfile				set filetype=ruby
au BufNewFile,BufRead [vV]agrantfile                    set filetype=ruby
au BufNewFile,BufRead .autotest				set filetype=ruby
au BufNewFile,BufRead *.erb,*.rhtml			set filetype=eruby
au BufNewFile,BufRead [tT]horfile,*.thor		set filetype=ruby
au BufNewFile,BufRead *.rabl				set filetype=ruby

" coffeescript stuff
au BufNewFile,BufRead *.cs,*.coffee	set filetype=coffee

" twig
"au BufNewFile,BufRead *.twig set filetype=twig
" HTML Twig
au BufNewFile,BufRead *.twig,*.html.twig set filetype=html.twig
