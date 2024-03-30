#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

update_and_install_packages () {
    sudo apt update
    sudo apt install git gh libc6-dev zsh neofetch dmenu xserver-xorg xinit libpangocairo-1.0-0 python3-pip python3-xcffib python3-cairocffi picom nodejs npm gcc
}

install_lazy_git () {
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm -rf ./lazygit.tar.gz lazygit
}

#update_and_install_packages
install_lazy_git

#/bin/bash $SCRIPT_DIR/setup_env.sh
