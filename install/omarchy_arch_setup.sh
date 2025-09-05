#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

set -e

update_and_install_packages () {
    sudo pacman -S --noconfirm zsh tmux
}

if [ "$1" = "run" ]; then
    update_and_install_packages
fi
