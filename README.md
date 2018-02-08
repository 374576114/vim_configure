# vim-configure

## INFO

- the scripts plugin and vimrc
- archlinux下面建议安装gvim，优点
  - 有`*` `+`等粘贴板，能与系统的粘贴板做交互
  - 编辑靠键盘，看源码靠鼠标

## 安装

- **注意，执行install.sh会覆盖你的~/.vimrc**
- 如果是初始环境，那么只需`./install.sh`，然后输入y确定覆盖
- 根据显示的todo去做接下来的事，基本上包括一下几件事
  - 执行`:PluginInstall`安装插件
  - 需要安装`YouCompleteMe`，可以[参考后面](#YouCompleteMe)
  - 根据需求修改**快捷键** **google-chrome**路径等
  - 同时可以根据自己需求删除自己不需要的插件

## 已经装的插件

- Plugin 'VundleVim/Vundle.vim'
- Plugin 'iamcco/mathjax-support-for-mkdp'
- Plugin 'iamcco/markdown-preview.vim'
- Plugin 'cscope.vim'
- Plugin 'vim-scripts/indentpython.vim'
- Plugin 'git://github.com/scrooloose/nerdtree.git'
- Plugin 'taghighlight'
- Plugin 'taglist.vim'
- Plugin 'winmanager'
- Plugin 'vim-airline'
- Plugin 'Valloric/YouCompleteMe'

## 一些好用的教程

- vim script语法说明 [点击](http://learnvimscriptthehardway.onefloweroneworld.com/)

### 配置中已经使用的F快捷键

- `F2` 调出NERDTree跟Tlist窗口
- `F3` 使用Cscope插件的功能，找出该函数被所有被调用的地方
- `F5` 使用`scripts/custom.vim`中的编译c/c++程序的函数

---

### Cscope

**前提**

首先需要需要确定**已经安装cscope**，同时vim插件中**有cscope.vim**

**基本用法**

`cscope -Rbq` 递归、不进GUI、快速，会生成三个文件`cscope.out` `cscope.in.out` `cscope.po.out`

**vim 映射及其基本用法**

```
" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>
```

### YouCompleteMe

**参考教程**

- [YouCompleteMe Install](http://valloric.github.io/YouCompleteMe/) 这里主要参考`YCM`的主要安装步骤，以及`.vimrc`中相关变量的配置等
- [YCM github](https://github.com/Valloric/YouCompleteMe) 这里主要是遇到一些问题时，查看对应的`issues`
- [Arch wiki](https://wiki.archlinux.org/index.php/Vim/YouCompleteMe#C.2FC.2B.2B) 可以参考一些配置

**必须的东西**

- 根据平台的不同，装的方法可能不同，但主要需要的东西有
  - `vim`, `python` 版本需要达到一定要求
  - `Vundle`中安装`YCM`
  - `cmake`, `g++`, `python-dev`
  - `libclang` **这点需要特别注意**
  - `.vimrc`中进行相应配置
- 找不到怎么办？
由于发行版本太多，同时每个版本中的包管理也不尽相同，那么此时可以用类似于
`pacman -Ss clang`的方法去检索对应的依赖，然后进行安装

**BUG 查询**

- 在vim启动后，可以通过`:YcmToggleLogs`指令查看对应log，如果是寻找**错误**，那么
就重点关注有`stderr`的那个log

**Arch 需要装的包**

`cmake` `ncurses5-compat-libs` `lib32-clang`

