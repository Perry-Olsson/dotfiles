#!/bin/bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp $script_dir/.vimrc $HOME/.vimrc
echo "copied new vimrc file into HOME directory"
cp -r $script_dir/nvim/init.vim $HOME/.config/nvim
echo "copied new init.vim file"
cp -r $script_dir/nvim/lua $HOME/.config/nvim
echo "copied nvim configuration directory"

