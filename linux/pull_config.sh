#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# copy x11 config
cp $HOME/.xinitrc $script_dir/x11/.xinitrc 
cp $HOME/.xprofile $script_dir/x11/.xprofile 

# copy zsh mixin
cp $HOME/.zsh_mixin $script_dir/
