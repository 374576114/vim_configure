#/bin/sh

function help()
{
    echo 'USAGE: ./install-plugin.sh parameter'
    echo 'PARA:'
    echo '  -hl install taghighligt, just unzip to your .vim'
}

# unzip the TagHighLight to ~/.vim
# just use bundle to install it
function highlight()
{
    hl='taghighlight_2.1.4.zip'
    echo "now we unzip the file ${hl} to .vim"
    unzip ${hl} -d ~/.vim
}

if [[ $# -lt 1 ]]; then
    help
fi


