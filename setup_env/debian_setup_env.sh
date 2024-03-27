#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

update_and_install_packages () {
    sudo apt update
    sudo apt install git gh libc6-dev zsh neofetch dmenu xserver-xorg xinit libpangocairo-1.0-0 python3-pip python3-xcffib python3-cairocffi picom nodejs npm gcc
}

update_and_install_packages

/bin/bash $SCRIPT_DIR/setup_env.sh
