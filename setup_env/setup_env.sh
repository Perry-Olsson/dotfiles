#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

set -e

configure_git () {
    git config --global user.email "olsson.perry@gmail.com"
    git config --global user.name "Perry Olsson"
}

create_dirs_and_modify_path () {
    mkdir $HOME/.local/bin
    mkdir $HOME/Pictures/backgrounds
    mkdir $HOME/.config/awesome
}

install_neovim () {
    wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    rm -rf $HOME/.config/nvim
    mkdir $HOME/.config/nvim
    sudo rm -rf /opt/nvim
    sudo tar -xzf nvim-linux-x86_64.tar.gz -C /opt 
}

install_fonts () {
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/0xProto.zip
    mkdir $HOME/.fonts 
    mkdir $HOME/.fonts/nerd-fonts
    unzip $SCRIPT_DIR/0xProto.zip -d $HOME/.fonts/nerd-fonts
    fc-cache -f -v
    rm $SCRIPT_DIR/0xProto.zip
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

install_terminal_emulator () {
    #todo
}

install_zsh () {
    chsh -s $(which zsh)
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) > ./install_zsh.sh
    chmod +x ./install_zsh.sh
    ./install_zsh.sh
}

install_node () {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
}

copy_environment_config () {
    /bin/bash $SCRIPT_DIR/environment-setups/cross_platform/neovim/update_config.sh
    /bin/bash $SCRIPT_DIR/environment-setups/linux/update_config.sh
    cp $SCRIPT_DIR/environment-setups/cross_platform/.zshrc $HOME/.zshrc
    cp $SCRIPT_DIR/environment-setups/linux/backgrounds/* $HOME/Pictures/backgrounds/
}

install_rust () {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

configure_git
create_dirs_and_modify_path
install_neovim
install_fonts
install_terminal_emulator
install_zsh
generate_ssh_key
clone_env_setup_repo
install_node
install_rust
copy_environment_config
