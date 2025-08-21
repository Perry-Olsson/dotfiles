#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

arg=$1

from_dir=""
to_dir=""

# If arg is pull, copy config from system in to dotfiles repo
# if not copy from dotfiles to system
if [[ $arg == "pull" ]]; then
    from_dir=$HOME
    to_dir=$script_dir/../../config
else
    from_dir=$script_dir/../../config
    to_dir=$HOME/
fi

cp $from_dir/.zshrc $to_dir/
cp $from_dir/.p10k.zsh $to_dir/
echo "Copied zsh configuration files"
