#!/bin/bash

wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf $HOME/.config/nvim
mkdir $HOME/.config/nvim
sudo rm -rf /opt/nvim
sudo tar -xzf nvim-linux-x86_64.tar.gz -C /opt 
