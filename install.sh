# /bin/sh

function note()
{
    echo '**Now you will use my vim-configure**'
    echo ''
    echo 'Following things will do:'
    echo ' 1.overwrite the "~/.vimrc" by "./vimrc"'
    echo ' 2.move the "./scripts" to "~/.vim/scripts"'
    echo '----------------------------------------------'
    echo 'If you want to **overwrite**, please input "y"'
    echo ' to continue '
    echo '----------------------------------------------'
}

function todo()
{
    echo ''
    echo 'Then what you need to do '
    echo ' 1.open your vim and use ":PluginInstall" to install all plugins'
    echo ' 2.see "YouCompletMe" in README.md to compile it'
    echo ' 3.maybe you need custom your:'
    echo '   --google-chrome path'
    echo '   --the map-key you like'
}


note

read choice

if [[ ${choice} == "y" ]]; then
    cp vimrc ~/.vimrc
    cp -r ./scripts ~/.vim/scripts
    todo
else
    echo 'Just see my ./vimrc and change your ~/.vimrc'
fi


