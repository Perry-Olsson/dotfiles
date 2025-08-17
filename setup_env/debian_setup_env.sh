#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

set -e

update_and_install_packages () {
    sudo apt update
    sudo apt install git gh curl pkg-config cmake libc6-dev feh ripgrep jq dunst lm-sensors xclip zsh fastfetch dmenu xserver-xorg xinit libpangocairo-1.0-0 python3-pip python3-xcffib python3-cairocffi picom nodejs npm gcc tmux
}

install_lazy_git () {
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm -rf ./lazygit.tar.gz lazygit
}

install_spotify () {
    curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
    echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update && sudo apt-get install spotify-client
}

update_and_install_packages
install_lazy_git
install_spotify

/bin/bash $SCRIPT_DIR/setup_env.sh
