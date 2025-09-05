#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/0xProto.zip
mkdir $HOME/.fonts 
mkdir $HOME/.fonts/nerd-fonts
unzip $SCRIPT_DIR/0xProto.zip -d $HOME/.fonts/nerd-fonts
fc-cache -f -v
rm $SCRIPT_DIR/0xProto.zip
