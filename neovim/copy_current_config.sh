#!/bin/bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp $HOME/.vimrc $script_dir/.vimrc
echo "copied vimrc rile"
cp -r $HOME/.config/nvim $script_dir
echo "copied nvim configuration directory"
rm -rf $script_dir/nvim/plugged
echo "removed pluggins directory"

