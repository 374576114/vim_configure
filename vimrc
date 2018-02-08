set nu
syntax on
set hls

"no backup file 
set nobackup
set noswapfile
set noundofile

" indent: 4 spaces
set ts=4
set sw=4
set expandtab " space instead of tab
set smartindent
set cino=g0
"[cino](http://edyfox.codecarver.org/html/_vimrc_for_beginners.html)
"[more cino](http://man.chinaunix.net/newsoft/vi/doc/indent.html)

" coding 
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,usc-bom,gb18030,gbk,gb2312,cp936
"set fileencoding=chinese

set nocompatible

"colorscheme autumn

"python scripts
source ~/.vim/scripts/*.vim

"map 
nmap <F5> <Esc>:call CallGpp()<CR>

" Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * exe "normal! g`\""
    au BufReadPost * exe "normal! zz"
endif

" plugin
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" :h markdown
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'cscope.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'taghighlight'
Plugin 'taglist.vim'
Plugin 'winmanager'
Plugin 'vim-airline'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" mark-down configure
let g:mkdp_path_to_chrome = '/opt/google/chrome/google-chrome'
"let g:mkdp_path_to_chrome = '/cygdrive/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'
let g:mkdp_auto_start = 0
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

"ctags
set tags=tags;
set autochdir
set tags+=./tags

" highlight
hi CTagsGlobalVariable ctermfg=124 cterm=bold
hi CTagsMember ctermfg=white
hi Function ctermfg=40
set t_Co=256

" NERD tree
set mouse=a
" map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd vimenter * NERDTree "自动打开NERDTree
let NERDTreeWinSize=20
let NERDTreeIgnore=['\.pyc','\.swp']

" Taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=1

" WinManager
let g:NERDTree_title="NERD Tree"
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth=30

function! NERDTree_Start() 
"    cmd bufenter * if (winnr("$") == 2 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary")  | qa | endif
" 关闭winmanager打开的一个空buff
    exec 'q'    
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
nmap <F2> : WMToggle<CR>

"YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_extra_conf_globlist=['~/dev/*', '~!~/*']
let g:ycm_autoclose_preview_window_after_completion=1

" cscope map
let mapleader="cs"
let csdb_path="~/RAID/raid_src/raid-fc-bio-ft/raid-fc-bio-ft/"
" add cscope db
cs add csdb_path
" cscope -Rbq
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>
nnoremap <F3> :call cscope#find('c', expand('<cword>'))<CR>

" air-line
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
