#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

arg=$1
file=$2

from_dir=""
to_dir=""

# If arg is pull, copy config from system in to dotfiles repo
# if not copy from dotfiles to system
if [[ $arg == "pull" ]]; then
    from_dir=$HOME/
    to_dir=$script_dir/../../config/
else
    from_dir=$script_dir/../../config/
    to_dir=$HOME/
fi

cp $from_dir/$file $to_dir/$file
echo "Copied $file configuration file"
