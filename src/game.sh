#!/bin/bash

install_game() {
    echo -e "                       \e[33m╭─────────────────────────────────────────────────╮\e[0m"
    echo -e "                       \e[33m|                                                 |\e[0m"
    echo -e "                       \e[33m|            Game Ready Packages - Arch           |\e[0m"
    echo -e "                       \e[33m|  Version 1.01 - TheDarkNightmare - PulseTools   |\e[0m"
    echo -e "                       \e[33m|                                                 |\e[0m"
    echo -e "                       \e[33m|                                                 |\e[0m"
    echo -e "                       \e[33m╰─────────────────────────────────────────────────╯\e[0m"

    # Install yay if not installed
    install_yay

    echo "                       [----------------- Core Packages ----------------]"
    # Install Steam Client  
    sudo pacman -S --noconfirm steam lutris

    echo "                       [----------------- ProtonUP-QT ----------------]"
    yay -S --noconfirm protonup-qt

    echo "                       [----------------- Vulkan Game Monitor Statistics  ----------------]"
    # Install MangoHud for 64 lib + 32 lib + Goverlay Settings
    yay -S --noconfirm goverlay mangohud lib32-mangohud 

    echo "                       [----------------- Bottles GUI Container ----------------]"
    # Install Bottles Container for Linux Games and Programs.
    yay -S --noconfirm bottles

    # Install Custom Wine TKG
    echo "                       [----------------- WineTKG ----------------]"
    git clone https://github.com/Frogging-Family/wine-tkg-git
    cd wine-tkg-git

    echo "                       [----------------- Compiling Wine TKG  ----------------]"
    makepkg -si --noconfirm

    cd ..
    rm -rf wine-tkg-git

    # Print a message indicating that the installation is complete
    echo "                       Installation complete."
}
