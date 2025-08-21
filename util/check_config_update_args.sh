#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source $script_dir/helpers.sh

config_arg=$1
valid_arg=0
search_dir=./util/copy_config

list_options() {
    echo "Available options: "
    for option in $(get_config_options);
    do
        echo $option
    done
}

check_arg() {
    for entry in $(get_config_options);
    do
        if [[ $entry == $config_arg ]]; then
            valid_arg=1
            break
        fi
    done

    if [[ $valid_arg -eq 0 ]]; then
        echo "Invalid config arg: $config_arg"
        list_options
        exit 1
    fi
}

check_arg
