#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
search_dir=$script_dir/copy_config

get_config_options() {
    echo $(ls $search_dir/* | sed -r 's/.*\/(.*)\.sh$/\1/g')
}

