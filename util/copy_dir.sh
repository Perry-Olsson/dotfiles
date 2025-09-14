#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

arg=$1
directory_name=$2

from_dir=""
to_dir=""

# If arg is pull, copy config from system in to dotfiles repo
# if not copy from dotfiles to system
if [[ $arg == "pull" ]]; then
    from_dir=$HOME/.config/$directory_name
    to_dir=$script_dir/../config
else
    from_dir=$script_dir/../config/$directory_name
    to_dir=$HOME/.config
fi

cp -r $from_dir $to_dir
echo "Copied $directory_name configuration files"
