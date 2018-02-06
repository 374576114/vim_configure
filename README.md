# vim-configure

## Info
the scripts plugin and vimrc

---

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

