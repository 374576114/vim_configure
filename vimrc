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
