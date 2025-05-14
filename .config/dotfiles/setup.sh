#!/bin/bash

cd ../..
cp -r .config/* $HOME/.config/ 
cp -r .git/* $HOME/.config/dotfiles/
cp -r .github $HOME
cp .zshrc $HOME
cp .p10k.zsh $HOME
cp .bashrc $HOME

cd $HOME/.config/ 
cp config.example config

chsh $USER /usr/bin/zsh
