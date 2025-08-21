#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

arg=$1

from_dir=""
to_dir=""

# If arg is pull, copy config from system in to dotfiles repo
# if not copy from dotfiles to system
if [[ $arg == "pull" ]]; then
    from_dir=$HOME/.config/nvim
    to_dir=$script_dir/../../config/nvim
else
    from_dir=$script_dir/../../config/nvim
    to_dir=$HOME/.config/nvim
fi

cp $from_dir/init.vim $to_dir/
cp -r $from_dir/lua $to_dir/
echo "Copied neovim configuration files"
