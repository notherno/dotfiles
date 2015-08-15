#!/bin/bash

DIR=$(dirname $0)

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

[ ! -e "$HOME/.vimrc" ] && ln -s $DIR/vimrc ~/.vimrc
[ ! -e "$HOME/.zshrc" ] && ln -s $DIR/zshrc ~/.zshrc
[ ! -e "$HOME/.tmux.conf" ] && ln -s $DIR/tmux.conf ~/.tmux.conf

