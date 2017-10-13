# 目录

- [缩进名词说明](#indent)

## INDENT

  `shiftwidth`: 这是程序中**自动缩进**所使用的空白长度制定一般来说是为了保持程序的美观

  `tabstop`: 定义*tab*所等同的空格长度，一般来说最好设置成8，因为如果是其它值的话，可能引起文件在打印之类的场合中看起来很别扭。 

  `softtabstop`: 当*shiftwidth*与*tabstop*不一样时,程序会特别难看，这时候就是*softtabstop*起作用。设置*softtabstop*后，我们按下tab键，插入的是**空格和tab制表符的混合**。

  `expandtab`: 这里将*tab*用具体的空格数代替，一般设置成4，可以进行如下设置
  ```
  set shifwidth=4
  set expandtab

  autocmd FileType c,cpp set shitftwidth=4 | set expandtab
  ```
