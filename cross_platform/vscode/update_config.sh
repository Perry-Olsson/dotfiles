#!/bin/bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# copy vscode settings
cp $script_dir/vscode_settings.json $HOME/.config/Code/User/settings.json
