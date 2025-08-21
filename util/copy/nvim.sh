#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

arg=$1

from_dir=""
to_dir=""

if [[ $arg == "pull" ]]; then
    from_dir=$HOME/.config/nvim
    to_dir=$script_dir/../../config/nvim
else
    from_dir=$script_dir/../../config/nvim
    to_dir=$HOME/.config/nvim
fi

echo "from dir: $from_dir"
echo "to dir: $to_dir"
