#!/bin/bash

set -e

if [[ $OSTYPE == "darwin"* ]]; then
    copy_osx_config
else
    copy_arch_linux_config
fi

copy_osx_config() {
    
}

copy_arch_linux_config() {
    # copy qtile config
    cp $HOME/.config/qtile/config.py config.py

    # copy vscode settings
    cp $HOME/.config/Code/User/settings.json vscode_settings.json

    # copy lightdm conf
    cp /etc/lightdm/lightdm.conf lightdm.conf

    # copy lightdm webkit2 greeter conf
    cp /etc/lightdm/lightdm-webkit2-greeter.conf lightdm-webkit2-greeter.conf
}
