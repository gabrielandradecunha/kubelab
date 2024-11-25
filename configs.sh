#!/bin/bash

NEW_HOSTNAME="kubelab"

echo "$NEW_HOSTNAME" | sudo tee /etc/hostname > /dev/null

sudo sed -i "s/127.0.1.1.*/127.0.1.1 $NEW_HOSTNAME/" /etc/hosts

sudo hostname "$NEW_HOSTNAME"

if [ $? -eq 0 ]; then
    echo -e "\033[32mO hostname foi alterado para $(hostname)\!\033[0m"
fi
