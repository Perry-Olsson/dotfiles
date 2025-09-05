#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

set -e

update_and_install_packages () {
    sudo apt update
    sudo apt install git gh curl fzf polybar pkg-config cmake libc6-dev feh ripgrep jq dunst lm-sensors xclip zsh fastfetch dmenu xserver-xorg xinit libpangocairo-1.0-0 python3-pip python3-xcffib python3-cairocffi picom nodejs npm gcc tmux
}

update_and_install_packages
$SCRIPT_DIR/scripts/install_lazy_git.sh
$SCRIPT_DIR/scripts/install_spotify.sh
$SCRIPT_DIR/scripts/configure_git.sh
$SCRIPT_DIR/scripts/create_dirs_and_modify_path.sh
$SCRIPT_DIR/scripts/install_neovim.sh
$SCRIPT_DIR/scripts/install_fonts.sh
$SCRIPT_DIR/scripts/generate_ssh_key.sh
$SCRIPT_DIR/scripts/clone_dotfiles.sh
$SCRIPT_DIR/scripts/install_nvm.sh
$SCRIPT_DIR/scripts/install_rust.sh
$SCRIPT_DIR/scripts/install_zoxide.sh
$SCRIPT_DIR/scripts/install_tpm.sh
$SCRIPT_DIR/scripts/install_tmuxifier.sh

# copy environment config
