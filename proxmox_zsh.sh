#!/bin/bash

# TODO: Remove pve-enterprise, add pve-no-subscription repo to sources.list(*)

# Update packages, install essentials
apt update
apt install -y build-essential git zsh htop bat

# Install: oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Add EZA to proxmox
apt update
apt install -y gpg

mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc |  gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" |  tee /etc/apt/sources.list.d/gierens.list
chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
apt update
apt install -y eza

# Add ohmyzsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/TwoPizza9621536/zsh-eza.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/eza
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
wget -q https://github.com/edwinzelf/stuff/raw/refs/heads/main/p10k.zsh -O ~/.p10k.zsh

# Set micro colorsheme
mkdir -p ~/.config/micro/colorschemes
wget -q https://github.com/catppuccin/micro/raw/refs/heads/main/src/catppuccin-mocha.micro -O ~/.config/micro/colorschemes/catppuccin-mocha.micro 
cat > ~/.config/micro/settings.json <<EOF
{
    "colorscheme": "catppuccin-mocha"
}
EOF
# done



# Add to .zshrc:
# plugins=(git zsh-syntax-highlighting zsh-autosuggestions eza)
# ZSH_THEME="powerlevel10k/powerlevel10k" 
# export BAT_THEME=Dracula
# export MICRO_TRUECOLOR=1
