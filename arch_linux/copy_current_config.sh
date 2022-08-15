#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# copy qtile config
cp -a $HOME/.config/qtile/*.py $script_dir/qtile

# copy lightdm conf
cp /etc/lightdm/lightdm.conf $script_dir/lightdm/lightdm.conf

# copy lightdm webkit2 greeter conf
cp /etc/lightdm/lightdm-webkit2-greeter.conf $script_dir/lightdm/lightdm-webkit2-greeter.conf

# copy kitty conf
cp -a $HOME/.config/kitty/* $script_dir/kitty

# copy scripts
cp -a $HOME/scripts/* $script_dir/scripts

# copy x11 config
cp $HOME/.xinitrc $HOME/.xprofile $script_dir/x11
