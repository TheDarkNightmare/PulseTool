#!/bin/bash

install_cannon() {
    echo -e "                       \e[32m╭─────────────────────────────────────────────────╮\e[0m"
    echo -e "                       \e[32m|                                                 |\e[0m"
    echo -e "                       \e[32m|       Cannon MG4250 Printer Drivers Install     |\e[0m"
    echo -e "                       \e[32m|  Version 1.03 - TheDarkNightmare - PulseTools   |\e[0m"
    echo -e "                       \e[32m|                                                 |\e[0m"
    echo -e "                       \e[32m|                                                 |\e[0m"
    echo -e "                       \e[32m╰─────────────────────────────────────────────────╯\e[0m"

    # Install yay if not installed
    install_yay

    echo "                       [----------------- Core Packages ----------------]"

    echo "Installing Cups and Gutenprint for basic Support..."
    sudo pacman -Syu --noconfirm cups gutenprint

    echo "                       [----------------- CUPS BJNP ----------------]"
    yay -S --noconfirm cups-bjnp

    echo "                       [----------------- Enable and Start CUPS ----------------]"
    echo "Enabling CUPS for Linux User System ...."
    sudo systemctl enable --now cups

    echo "                       [----------------- Install KDE Settings Printer ----------"

    echo "Installing KDE Printer Applet ....."
    sudo pacman -Syu --noconfirm system-config-printer

    echo "                       Installation complete. Please add your printer via KDE Printer Settings"
}
