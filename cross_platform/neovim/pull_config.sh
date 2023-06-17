#!/bin/bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp $HOME/.config/nvim/init.vim $script_dir/nvim
cp -r $HOME/.config/nvim/lua $script_dir/nvim
echo "copied nvim configuration directory"
