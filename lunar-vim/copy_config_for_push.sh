#!/bin/bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp -r $HOME/.config/lvim/config.lua $script_dir
echo "copied lvim configuration files"

