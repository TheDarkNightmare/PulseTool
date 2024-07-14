#!/bin/bash

# Function to install yay if not installed
install_yay() {
    if ! command -v yay &> /dev/null; then
        echo -e "[\e[31m----------------- System Checking ----------------\e[0m]"
        echo "yay is not installed. Installing yay ..."
        sudo pacman -S --needed --noconfirm base-devel
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
    fi
}

# Function to install Multimedia package
install_multimedia() {
    echo ""
    echo -e "\e[31m╭─────────────────────────────────────────────────╮\e[0m"
    echo -e "\e[31m|                                                 |\e[0m"
    echo -e "\e[31m|              Multimedia Package                 |\e[0m"
    echo -e "\e[31m|  Version 1.01 - TheDarkNightmare - PulseTools   |\e[0m"
    echo -e "\e[31m|                                                 |\e[0m"
    echo -e "\e[31m|                                                 |\e[0m"
    echo -e "\e[31m╰─────────────────────────────────────────────────╯\e[0m"

    echo "[----------------- OBS Studio + Addons ----------------]"
    yay -S obs-studio-browser obs-vkcapture obs-vaapi obs-cmd lib32-obs-vkcapture

    echo -e "[\e[31m----------------- Core Packages ----------------\e[0m]"
    sudo pacman -S --noconfirm firefox discord kdenlive elisa thunderbird

    # Install yay if not installed
    install_yay

    echo "[----------------- Discord Addons ----------------]"
    yay -S --noconfirm betterdiscord-installer



    echo "[----------------- Video Capture Fix ----------------]"
    sudo pacman -S --noconfirm xwaylandvideobridge

    echo "[----------------- Spotify ----------------]"
    yay -S --noconfirm spotify

    echo "[----------------- Media Codecs ----------------]"
    sudo pacman -S --noconfirm x265 x264 svt-av1 libmpeg2 libvpx gst-plugins-ugly gst-plugins-va

    echo "[----------------- Image Programs ----------------]"
    sudo pacman -S --noconfirm gwenview gimp spectacle

    echo "Installation of Multimedia package complete."
}

# Function to install Cannon MG4250 Printer Drivers
install_cannon() {
    echo "╭─────────────────────────────────────────────────╮"
    echo "|                                                 |"
    echo "|       Cannon MG4250 Printer Drivers Install     |"
    echo "|  Version 1.03 - TheDarkNightmare - PulseTools   |"
    echo "|                                                 |"
    echo "|                                                 |"
    echo "╰─────────────────────────────────────────────────╯"

    # Install yay if not installed
    install_yay

    echo "[----------------- Core Packages ----------------]"
    sudo pacman -Syu --noconfirm cups gutenprint

    echo "[----------------- CUPS BJNP ----------------]"
    yay -S --noconfirm cups-bjnp

    echo "[----------------- Enable and Start CUPS ----------------]"
    sudo systemctl enable --now cups

    echo "Installation complete. Please add your printer via KDE Printer Settings"
}

# Function to install Game packages
install_game() {
    echo "╭─────────────────────────────────────────────────╮"
    echo "|                                                 |"
    echo "|            Game Ready Packages - Arch           |"
    echo "|  Version 1.01 - TheDarkNightmare - PulseTools   |"
    echo "|                                                 |"
    echo "|                                                 |"
    echo "╰─────────────────────────────────────────────────╯"

    # Install yay if not installed
    install_yay

    echo "[----------------- Core Packages ----------------]"
    # Install Steam Client  
    sudo pacman -S --noconfirm steam lutris

    echo "[----------------- ProtonUP-QT ----------------]"
    yay -S --noconfirm protonup-qt

    echo "[----------------- Vulkan Game Monitor Statistics  ----------------]"
    #Install MangoHud for 64 lib + 32 lib + Goverlay Settings
    yay -S --noconfirm goverlay mangohud lib32-mangohud 

    echo "[----------------- Bottles GUI Container ----------------]"
    # Install Bottles Container for Linux Games and Programs.
    yay -S --noconfirm bottles

    # Install Custom Wine TKG
    echo "[----------------- WineTKG ----------------]"
    git clone https://github.com/Frogging-Family/wine-tkg-git
    cd wine-tkg-git

    echo "[----------------- Compiling Wine TKG  ----------------]"
    makepkg -si --noconfirm

    cd ..
    rm -rf wine-tkg-git

    # Print a message indicating that the installation is complete
    echo "Installation complete."
}

# Function to install FastFetch
install_fastfetch() {
    echo "╭─────────────────────────────────────────────────╮"
    echo "|                                                 |"
    echo "|      FastFetch - System User Configuration      |"
    echo "|  Version 1.06 - TheDarkNightmare - PulseTools   |"
    echo "|                                                 |"
    echo "|                                                 |"
    echo "╰─────────────────────────────────────────────────╯"

    # Update the package database and install FastFetch
    sudo pacman -Syu --noconfirm fastfetch

    # Generate default config in ~/.config/fastfetch
    fastfetch --gen-config

    sleep 5

    # Removing default config for new one
    rm ~/.config/fastfetch/config.jsonc

    # Check if the directory exists
    if [ -d "$HOME/KWinScripts/" ]; then
        cd "$HOME/KWinScripts/"

        sleep 5

        # Downloading Files (config and image logo)
        wget -O config.jsonc https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/config.jsonc
        wget -O ARC2.png https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/ARC2.png

        # Copying config file to destination
        cp config.jsonc ~/.config/fastfetch/

        # Cleaning downloaded config from temp location.
        rm config.jsonc
        sleep 5

        # Pulling font icons from repo.
        kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFontMono-Regular.ttf

        sleep 5

        # Pulling font icons from repo.
        kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFont-Regular.ttf

        echo "Installation complete. Please check your fastfetch settings"
    else
        echo "Directory $HOME/KWinScripts/ does not exist."
        read -p "Would you like to create the directory and download the files? (y/n): " choice
        if [ "$choice" = "y" ]; then
            mkdir -p "$HOME/KWinScripts/"
            cd "$HOME/KWinScripts/"

            sleep 5

            # Downloading Files (config and image logo)
            wget -O config.jsonc https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/config.jsonc
            wget -O ARC2.png https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/ARC2.png

            # Copying config file to destination
            cp config.jsonc ~/.config/fastfetch/

            # Cleaning downloaded config from temp location.
            rm config.jsonc
            sleep 5

            # Pulling font icons from repo.
            kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFontMono-Regular.ttf

            sleep 5
            # Pulling font icons from repo.
            kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFont-Regular.ttf

             # The command to add to .bashrc
            COMMAND="fastfetch"

            # Check if the command already exists in .bashrc
            if ! grep -q "$COMMAND" ~/.bashrc; then
                echo "$COMMAND" >> ~/.bashrc
                echo "Added '$COMMAND' to ~/.bashrc"
            else
                echo "'$COMMAND' is already in ~/.bashrc"
            fi

            echo "Installation complete. Please check your fastfetch settings"
        else
            echo "Exiting without making changes."
            exit 1
        fi
    fi
}

# Function to display menu and handle package selection
select_packages() {
    local packages=("󱤵 • Multimedia" " • Cannon MG4250" "󰆍 • FastFetch" "󰊗 • GamePackage")
    local selected=()

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

        read -rp "Enter package numbers separated by space (or 'q' to quit): " input

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

        if [[ ${#selected[@]} -gt 0 ]]; then
            for pkg in "${selected[@]}"; do
                case $pkg in
                    "󱤵 • Multimedia") install_multimedia ;;
                    " • Cannon MG4250") install_cannon ;;
                    "󰆍 • FastFetch") install_fastfetch ;;
                    "󰊗 • GamePackage") install_game ;;
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
