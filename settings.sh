#!/bin/bash

DIR=$(cd $(dirname $0) && pwd)
echo "Conf directory is '$DIR'"

# git config
git config --global user.name "Takaaki Kitano"
git config --global user.email "kitanow.takaaki@gmail.com"
git config --global color.ui auto

if [ ! -e "$HOME/src/dircolors-solarized" ] ; then
    git clone https://github.com/seebi/dircolors-solarized $HOME/src/dircolors-solarized
fi

if [ ! -e "$HOME/.vim/bundle" ] ; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# symbolic links
if [ ! -e "$HOME/.vimrc" ] ; then
    ln -s $DIR/vimrc ~/.vimrc && echo "Created link for vimrc"
fi

if [ ! -e "$HOME/.zshrc" ] ; then
    ln -s $DIR/zshrc ~/.zshrc && echo "Created link for zshrc"
fi

if [ ! -e "$HOME/.tmux.conf" ] ; then
    ln -s $DIR/tmux.conf ~/.tmux.conf && echo "Created link for tmux"
fi

