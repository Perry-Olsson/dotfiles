#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# copy x11 config
cp $script_dir/x11/.xinitrc $HOME/.xinitrc 
cp $script_dir/x11/.xprofile $HOME/.xprofile

# copy awesome config
cp -a $script_dir/awesome/* $HOME/.config/awesome/

# copy zsh mixin
cp $script_dir/.zsh_mixin $HOME/

cp -a $script_dir/polybar/* $HOME/.config/polybar
