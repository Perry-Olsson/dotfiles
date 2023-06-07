#!/bin/bash
#
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash $script_dir/cross_platform/pull.sh
