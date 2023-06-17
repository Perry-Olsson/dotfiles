#!/bin/bash
#
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash $script_dir/lunar-vim/pull_config.sh
/bin/bash $script_dir/vscode/pull_config.sh
/bin/bash $script_dir/neovim/pull_config.sh

cp $HOME/.zshrc $script_dir/.zshrc
