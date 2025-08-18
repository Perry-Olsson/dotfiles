#!/bin/bash
#
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash $script_dir/neovim/update_config.sh

cp $script_dir/.zshrc $HOME/.zshrc
cp $script_dir/.p10k.zsh $HOME/.p10k.zsh 
cp $script_dir/.zsh_mixin $HOME/.zsh_mixin 


