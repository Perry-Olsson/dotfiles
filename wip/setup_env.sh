#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# set -e
mkdir $HOME/.bin
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt-get install git gh neovim
if [ "$SKIP_SSH_KEY_GEN" != "true" ]; then
  ssh-keygen -t ed25519 -C "olsson.perry@gmail.com"
  eval "$(ssh-agent -s)"
  ssh-add $HOME/.ssh/id_ed25519
fi
if [ "$SKIP_GH_AUTH" != "true" ]; then
  gh auth login
fi
git clone git@github.com:Perry-Olsson/environment-setups.git
