#!/bin/bash
#
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash $script_dir/neovim/pull_config.sh

cp $HOME/.zshrc $script_dir/.zshrc
cp $HOME/.p10k.zsh $script_dir/.p10k.zsh
cp $HOME/.tmux.conf $script_dir/.tmux.conf
