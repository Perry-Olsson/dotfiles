#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_dirs_and_modify_path () {
    mkdir $HOME/.bin
    mkdir $HOME/.local/bin
    mkdir $HOME/Pictures/backgrounds
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc
}

install_neovim () {
    wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    rm -rf $HOME/.config/nvim
    mkdir $HOME/.config/nvim
    tar -xzvf nvim-linux64.tar.gz -C $HOME/.bin
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
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
    # Place the kitty.desktop file somewhere it can be found by the OS
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    # Update the paths to the kitty and its icon in the kitty.desktop file(s)
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
}

install_zsh () {
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo 'export PATH="$HOME/.bin/nvim-linux64/bin:$HOME/.local/bin:$PATH"' >> $HOME/.zshrc
}

install_qtile () {
    pip install qtile
}

install_node () {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    nvm install 20
}

copy_environment_config () {
    /bin/bash $SCRIPT_DIR/environment-setups/cross_platform/neovim/update_config.sh
    /bin/bash $SCRIPT_DIR/environment-setups/linux/update_config.sh
    cp $SCRIPT_DIR/environment-setups/cross_platform/.zshrc $HOME/.zshrc
    cp $SCRIPT_DIR/environment-setups/linux/backgrounds/* $HOME/Pictures/backgrounds/
}

# create_dirs_and_modify_path
# install_neovim
# install_fonts
# install_terminal_emulator
# install_zsh
# generate_ssh_key
# clone_env_setup_repo
# install_qtile
# install_node
# copy_environment_config
