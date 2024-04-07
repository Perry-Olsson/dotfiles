#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# copy x11 config
cp $HOME/.xinitrc $script_dir/x11/.xinitrc 
cp $HOME/.xprofile $script_dir/x11/.xprofile 

# copy kitty conf
cp -a $HOME/.config/kitty/kitty.conf $script_dir/kitty/kitty.conf 

# copy qtile
sudo cp /usr/share/xsessions/qtile.desktop $script_dir/qtile/
cp -a $HOME/.config/qtile/*.py $script_dir/qtile/
cp -a$HOME/.config/icons/ $script_dir/qtile/

# copy zsh mixin
cp $HOME/.zsh_mixin $script_dir/
