#!/bin/bash

set -e

# copy qtile config
cp $HOME/.config/qtile/config.py config.py

# copy lightdm conf
cp /etc/lightdm/lightdm.conf lightdm.conf

# copy lightdm webkit2 greeter conf
cp /etc/lightdm/lightdm-webkit2-greeter.conf lightdm-webkit2-greeter.conf
