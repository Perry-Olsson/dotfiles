#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

set -e

update_and_install_packages () {
    sudo pacman -S --noconfirm zsh tmux
}

update_and_install_packages
$SCRIPT_DIR/scripts/generate_ssh_key.sh
$SCRIPT_DIR/scripts/clone_dotfiles.sh
$SCRIPT_DIR/scripts/install_tpm.sh
$SCRIPT_DIR/scripts/install_tmuxifier.sh
