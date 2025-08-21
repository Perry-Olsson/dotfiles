#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# copy kitty conf
cp -a $script_dir/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

# copy qtile
sudo cp $script_dir/qtile/qtile.desktop /usr/share/xsessions/
cp -a $script_dir/qtile/*.py $HOME/.config/qtile/
cp -a $script_dir/qtile/icons/ $HOME/.config/

