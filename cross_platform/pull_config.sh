#!/bin/bash
#
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash $script_dir/neovim/pull_config.sh

cp $HOME/.zsh_mixin $script_dir/.zsh_mixin
cp $HOME/.zshrc $script_dir/.zshrc
cp $HOME/.p10k.zsh $script_dir/.p10k.zsh
