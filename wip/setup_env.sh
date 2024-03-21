#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

update_and_install_packages () {
    sudo apt-get update
    sudo apt-get install git gh libc6-dev
}

install_neovim () {
    mkdir $HOME/.bin
    wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    tar -xzvf nvim-linux64.tar.gz -C $HOME/.bin
    echo 'export PATH="$HOME/.bin/nvim-linux64/bin:$PATH"' >> $HOME/.bashrc
}

install_fonts () {
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/3270.zip
    mkdir $HOME/.fonts 
    mkdir $HOME/.fonts/nerd-fonts
    unzip $SCRIPT_DIR/3270.zip -d $HOME/.fonts/nerd-fonts
    fc-cache -f -v
    rm $SCRIPT_DIR/3270.zip
}

generate_ssh_key () {
    if [ "$SKIP_SSH_KEY_GEN" != "true" ]; then
      ssh-keygen -t ed25519 -C "olsson.perry@gmail.com"
      eval "$(ssh-agent -s)"
      ssh-add $HOME/.ssh/id_ed25519
    fi
}

clone_env_setup_repo () {
    if [ "$SKIP_GH_AUTH" != "true" ]; then
      gh auth login
    fi
    git clone git@github.com:Perry-Olsson/environment-setups.git
}

copy_environment_config () {
    rm -rf $HOME/.config/nvim
    mkdir $HOME/.config/nvim
    /bin/bash SCRIPT_DIR/environment-setups/cross_platform/neovim/update_config.sh
}

update_and_install_packages
install_neovim
install_fonts
generate_ssh_key
clone_env_setup_repo
copy_environment_config
