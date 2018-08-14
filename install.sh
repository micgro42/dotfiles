#!/usr/bin/env zsh
set -euo pipefail
IFS='\n\t'

HERE=`pwd`

function installDotfile {

        # If no filename is provided to the function report an error and exit
        if [[ -z ${1+x} ]]; then
                echo "no filename given!"
                return
        fi

        # if the filename doesn't exist report an error and exit
        if [[ ! -e $1 ]]; then
                echo "file $1 does not exist locally!"
                return
        fi

        # if the destination exists and is a symlink, then remove it
        if [[ -h "$HOME/.$1" ]]; then
            rm -f "$HOME/.$1"
        fi

        # if the destination exists then move it to a backup
        if [[ -e "$HOME/.$1" ]]; then
            mv "$HOME/.$1" "$HOME/.${1}_bak"
        fi

        # link the filename to the home directory
        ln -s "$HERE/$1" "$HOME/.$1"

}

installDotfile zshrc
installDotfile vimrc
installDotfile gitconfig
installDotfile shell_aliases
installDotfile spacemacs

######## vim ###########


if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
        mkdir -p ~/.vim/bundle
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
        cd "$HOME/.vim/bundle/Vundle.vim/"
        git pull
        cd -
fi

vim +PluginInstall! +qall

mkdir -p ~/.local/share/fonts/

cp -u ~/.vim/bundle/powerline/font/PowerlineSymbols.otf ~/.local/share/fonts/
if [[ -z ${XDG_CONFIG_HOME+x} ]]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi
mkdir -p $XDG_CONFIG_HOME/fontconfig/conf.d/
cp -u ~/.vim/bundle/powerline/font/10-powerline-symbols.conf $XDG_CONFIG_HOME/fontconfig/conf.d/

(~/.vim/bundle/fonts/install.sh)

