#!/usr/bin/env zsh
set -euo pipefail
IFS='\n\t'

HERE=`pwd`

function installDotfile {

        if [[ -z ${1+x} ]]; then
                echo "no filename given!"
                return
        fi

        if [[ ! -e $1 ]]; then
                echo "file $1 does not exist locally!"
                return
        fi

        if [[ -h "$HOME/.$1" ]]; then
            rm -f "$HOME/.$1"
        fi

        if [[ -e "$HOME/.$1" ]]; then
            mv "$HOME/.$1" "$HOME/.${1}_bak"
        fi

        ln -s "$HERE/$1" "$HOME/.$1"

}

installDotfile zshrc
installDotfile vimrc
installDotfile gitconfig
installDotfile shell_aliases

######## vim ###########


if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
        mkdir -p ~/.vim/bundle
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
        cd "$HOME/.vim/bundle/Vundle.vim/"
        git pull
        cd -
fi

vim +BundleInstall +qall

cp -u ~/.vim/bundle/powerline/font/PowerlineSymbols.otf ~/.local/share/fonts/
if [[ -z ${XDG_CONFIG_HOME+x} ]]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi
mkdir -p $XDG_CONFIG_HOME/fontconfig/conf.d/
cp -u ~/.vim/bundle/powerline/font/10-powerline-symbols.conf $XDG_CONFIG_HOME/fontconfig/conf.d/

(~/.vim/bundle/fonts/install.sh)

