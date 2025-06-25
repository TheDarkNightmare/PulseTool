#!/bin/bash

# Function to install yay if not installed
install_aur_systeminit() {
    if ! command -v yay &> /dev/null; then
        echo -e "                       [\e[31m----------------- System Checking ----------------\e[0m]"
        echo "Paru package is not installed. Installing Paru backend for AUR ..."
        sudo pacman -S --needed --noconfirm base-devel
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si --noconfirm
        cd ..
        rm -rf paru
    fi
}
