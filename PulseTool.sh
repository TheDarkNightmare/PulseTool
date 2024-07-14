#!/bin/bash

# Function to install Multimedia package
install_multimedia() {
    echo "[----------------------------------------------]"
    echo "|                                              |"
    echo "|           Multimedia Package - Arch          |"
    echo "|                                              |"
    echo "| Version 1.01 - TheDarkNightmare - PulseTools |"
    echo "|                                              |"
    echo "[----------------------------------------------]"

    echo "[----------------- Core Packages ----------------]"
    sudo pacman -S --noconfirm firefox discord vlc kdenlive elisa thunderbird

    # Check if yay is installed
    if ! command -v yay &> /dev/null
    then
        echo "[----------------- System Checking ----------------]"
        echo "yay is not installed. Installing yay ..."
        # Install paru if not installed - First Base package dev.
        sudo pacman -S --needed --noconfirm base-devel
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
    fi

    echo "[----------------- Discord Addons ----------------]"
    yay -S --noconfirm betterdiscord-installer

    echo "[----------------- OBS Studio + Addons ----------------]"
    yay -S --noconfirm obs-studio-browser obs-vkcapture obs-vaapi obs-cmd lib32-obs-vkacapture

    echo "[----------------- Video Capture Fix ----------------]"
    sudo pacman -S --noconfirm xwaylandvideobridge

    # Install Spotify
    yay -S --noconfirm spotify

    # Install codecs
    echo "[----------------- Media Codecs ----------------]"
    sudo pacman -S x265 x264 svt0av libmpeg2 libvpx gst-plugins-ugly gst-plugin-va 

    # Image programs
    sudo pacman -S gwenview gimp spectacle

    # Print a message indicating that the installation is complete
    echo "Installation of Multimedia package complete."
}

# Function to display menu and handle package selection
select_packages() {
    local packages=("󱤵 • Multimedia" " • Cannon MG4250" "󰆍 • FastFetch" "󰊗 • GamePackage")
    local selected=()

    # Loop to display menu
    while true; do
        clear
        echo "╭─────────────────────────────────────────────────╮"
        echo "|                                                 |"
        echo "|       PulseTools Installer - ArchLinux          |"
        echo "|       Version 1.01 - TheDarkNightmare           |"
        echo "|                                                 |"
        echo "|  https://github.com/TheDarkNightmare/PulseTool  |"
        echo "|                                                 |"
        echo "╰─────────────────────────────────────────────────╯"
        echo "Select packages to install (use space to toggle selection, Enter to install):"
        for ((i=0; i<${#packages[@]}; i++)); do
            echo "$((i + 1))) ${packages[$i]}"
        done

        # Prompt user for selection
        read -rp "Enter package numbers separated by space (or 'q' to quit): " input

        # Handle user input
        case $input in
            q|Q) exit ;;
            *) 
                selected=()
                for num in $input; do
                    if [[ $num =~ ^[1-4]$ && $num -ge 1 && $num -le ${#packages[@]} ]]; then
                        selected+=("${packages[$((num - 1))]}")
                    else
                        echo "Invalid selection: $num"
                    fi
                done
                ;;
        esac

        # Install selected packages
        if [[ ${#selected[@]} -gt 0 ]]; then
            for pkg in "${selected[@]}"; do
                case $pkg in
                    "󱤵 • Multimedia") install_multimedia ;;
                    # Add other packages as needed
                    *) echo "Package '$pkg' installation not implemented." ;;
                esac
            done
            break
        fi
    done
}

# Main script logic
select_packages
