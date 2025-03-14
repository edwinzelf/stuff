#!/bin/bash

# Update packages, install essentials
apt update
apt install -y build-essential git zsh htop bat gpg micro duf ncdu

# make bat command work ;-)
ln -s /usr/bin/batcat /usr/bin/bat 

# Add EZA to proxmox
mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc |  gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" |  tee /etc/apt/sources.list.d/gierens.list
chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
apt update
apt install -y eza

# Install: oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s /bin/zsh

# Add ohmyzsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/TwoPizza9621536/zsh-eza.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/eza
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
wget -q https://raw.githubusercontent.com/edwinzelf/stuff/refs/heads/main/proxmox/.p10k.zsh -O ~/.p10k.zsh
wget -q https://raw.githubusercontent.com/edwinzelf/stuff/refs/heads/main/proxmox/.zshrc -O ~/.zshrc


# Set micro colorsheme
mkdir -p ~/.config/micro/colorschemes
wget -q https://github.com/catppuccin/micro/raw/refs/heads/main/src/catppuccin-mocha.micro -O ~/.config/micro/colorschemes/catppuccin-mocha.micro 
wget -q https://github.com/edwinzelf/stuff/raw/refs/heads/main/proxmox/.config/micro/settings.json -O ~/.config/micro/settings.json

# SwapShell Script
wget -q https://raw.githubusercontent.com/edwinzelf/stuff/refs/heads/main/proxmox/swapshell.sh -O ~/swapshell.sh
chmod +x ~/swapshell.sh



# done

