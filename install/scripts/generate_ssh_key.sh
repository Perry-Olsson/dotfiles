#!/bin/bash

ssh-keygen -t ed25519 -C "olsson.perry@gmail.com"
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_ed25519
