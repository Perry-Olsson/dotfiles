#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# set -e
sudo apt update
sudo apt-get install git gh libc6-dev

mkdir $HOME/.bin
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xzvf nvim-linux54.tar.gz -C $HOME/.bin
echo 'export PATH="$HOME/.bin/nvim-linux-64/bin:$PATH"' >> .$HOME/.bashrc

if [ "$SKIP_SSH_KEY_GEN" != "true" ]; then
  ssh-keygen -t ed25519 -C "olsson.perry@gmail.com"
  eval "$(ssh-agent -s)"
  ssh-add $HOME/.ssh/id_ed25519
fi
if [ "$SKIP_GH_AUTH" != "true" ]; then
  gh auth login
fi
git clone git@github.com:Perry-Olsson/environment-setups.git
rm -rf $HOME/.config/nvim
mkdir $HOME/.config/nvim
/bin/bash SCRIPT_DIR/environment-setups/cross_platform/neovim/nvim/update_config.sh
