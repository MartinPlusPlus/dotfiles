#!/bin/bash

# Starship
curl -sS https://starship.rs/install.sh | sh

# Neovim
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt install neovim

# Nerd Fonts
mkdir $HOME/.fonts
cd $HOME/.fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Agave.zip"
unzip *.zip
fc-cache -fv
rm *.zip
