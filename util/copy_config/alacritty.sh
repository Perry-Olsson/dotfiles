#!/bin/bash
script_dir="$(dirname "$(readlink -f "$0")")"
$script_dir/../copy_dir.sh $1 alacritty
