#!/bin/bash

git config --global user.name "Takaaki Kitano"
git config --global user.email "kitanow.takaaki@gmail.com"
git config --global color.ui auto

if [ ! -e "$HOME/src/dircolors-solarized" ] ; then
    git clone https://github.com/seebi/dircolors-solarized
fi

if [ ! -e "$HOME/.vim/bundle" ] ; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

