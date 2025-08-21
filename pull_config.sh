#!/bin/bash

set -e

config_arg=$1

./util/check_config_update_args.sh $config_arg

bash "./util/copy/${config_arg}.sh" pull
