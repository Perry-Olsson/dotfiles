#!/bin/bash

config_arg=$1
valid_arg=0
search_dir=./util/copy

list_options() {
    echo "Available options: "
    for entry in "$search_dir"/*
    do
        echo "$entry" | sed -r 's/.*\/(.*)\.sh$/\1/g'
    done
}

check_arg() {
    for entry in "$search_dir"/*
    do
        arg=$(echo "$entry" | sed -r 's/.*\/(.*)\.sh$/\1/g')
        if [[ $arg == $config_arg ]]; then
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
