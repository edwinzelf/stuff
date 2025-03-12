#!/bin/bash

# TODO: Remove pve-enterprise, add pve-no-subscription repo to sources.list(*)

# Update packages, install essentials
apt update
apt install -y build-essential git zsh htop

# Install: oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

