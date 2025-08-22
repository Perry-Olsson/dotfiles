#!/bin/bash

# PUSH CONFIG FROM DOTFILE TO SYSTEM

set -e

config_arg=$1

./util/check_config_update_args.sh $config_arg

bash "./util/copy_config/${config_arg}.sh" update
