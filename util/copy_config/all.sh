#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source $script_dir/../helpers.sh

arg=$1

for each in $(get_config_options);
do
    if [[ $each != "all" ]]; then
        $script_dir/copy_config/$each.sh $arg
    fi
done
