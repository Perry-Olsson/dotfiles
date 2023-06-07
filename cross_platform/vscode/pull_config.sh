#!/bin/bash

set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# copy vscode settings
cp $HOME/.config/Code/User/settings.json $script_dir/vscode_settings.json
echo "Pulled vscode configuration files"
