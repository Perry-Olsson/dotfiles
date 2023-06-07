#!/bin/bash
#
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash $script_dir/lunar-vim/update_config.sh
/bin/bash $script_dir/vscode/update_config.sh


