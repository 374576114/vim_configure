set nu
syntax on
set nobackup
set noswapfile
set noundofile
set ts=4
set sw=4
set hls
set smartindent

" coding 
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,usc-bom,gb18030,gbk,gb2312,cp936
"set fileencoding=chinese

set nocompatible

colorscheme autumn


"python scripts
source ~/.vim/scripts/*.vim


"map 
:map <F5> <Esc>:call CallGpp()<CR>

" plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'vim-scripts/indentpython.vim'


call vundle#end()
filetype plugin indent on

let g:mkdp_path_to_chrome = '/cygdrive/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'
let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0

" html indent
let g:html_indent_sript1='inc'
let g:html_indent_style1='inc'
let g:html_indent_inctags='html,body,head,tbody'

"PEP8
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |

let python_highlight_all=1
