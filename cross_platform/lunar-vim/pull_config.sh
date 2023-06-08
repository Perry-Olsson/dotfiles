#!/bin/bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp -r $HOME/.config/lvim/config.lua $script_dir
cp -r $HOME/.config/lvim/lua $script_dir
echo "pulled lvim configuration files"

