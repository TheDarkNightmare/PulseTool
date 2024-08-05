#!/bin/bash

# Function to install yay if not installed
install_yay() {
    if ! command -v yay &> /dev/null; then
        echo -e "                       [\e[31m----------------- System Checking ----------------\e[0m]"
        echo "yay is not installed. Installing yay ..."
        sudo pacman -S --needed --noconfirm base-devel
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
    fi
}
