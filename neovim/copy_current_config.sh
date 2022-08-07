#!/bin/bash
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp $HOME/.vimrc $script_dir/.vimrc
cp -r $HOME/.config/nvim $script_dir
rm -rf $script_dir/nvim/plugged
