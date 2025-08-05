#!/bin/bash

# Install AUR helper (paru) if not installed
install_aur_helper() {
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

# Wrapper to install base package requirements
install_base_package() {
    install_aur_helper
}

# ----- Game related helpers -----
install_steam() {
    echo "Installing Steam Client for Arch Linux ...."
    sudo pacman -S steam && echo "Steam package installed."
}

install_lutris() {
    echo "Installing additional packages ......."
    sudo pacman -S --noconfirm steam lutris && echo "Lutris packages installed."
}

install_protonup() {
    echo "                       [----------------- ProtonUP-QT ----------------]"
    paru -S --noconfirm protonup-qt && echo "ProtonUP-QT package installed."
}

install_mangohud() {
    echo "                       [----------------- Vulkan Game Monitor Statistics  ----------------]"
    echo "Installing MangoHud and Goverlay packages ...."
    yay -S --noconfirm goverlay mangohud lib32-mangohud
    echo 'export MANGOHUD=1' >> ~/.bashrc
}

install_bottles() {
    echo "                       [----------------- Bottles GUI Container ----------------]"
    paru -S --noconfirm bottles && echo "Bottles package installed."
}

install_wine() {
    sudo pacman -S --noconfirm wine
}

configure_wine() {
    echo "Prepearing WINE ..  Instaling Mono Engine for user in enviroment ......"
    sleep 5
    winecfg
}

install_winetricks() {
    echo "Installing Winetricks GUI control for wine prefixes...."
    sudo pacman -S --noconfirm winetricks
}

install_game() {
    echo -e "                       \e[33m╭─────────────────────────────────────────────────╮\e[0m"
    echo -e "                       \e[33m|                                                 |\e[0m"
    echo -e "                       \e[33m|            Game Ready Packages - Arch           |\e[0m"
    echo -e "                       \e[33m|                 Version 1.02                    |\e[0m"
    echo -e "                       \e[33m|                                                 |\e[0m"
    echo -e "                       \e[33m|                                                 |\e[0m"
    echo -e "                       \e[33m╰─────────────────────────────────────────────────╯\e[0m"
    install_aur_helper
    echo "                       [----------------- Core Packages ----------------]"
    install_steam
    install_lutris
    install_protonup
    install_mangohud
    install_bottles
    install_wine
    configure_wine
    install_winetricks
    echo "                       Installation complete."
}

# ----- Cannon printer -----
install_cannon() {
    echo -e "                       \e[32m╭─────────────────────────────────────────────────╮\e[0m"
    echo -e "                       \e[32m|                                                 |\e[0m"
    echo -e "                       \e[32m|       Cannon MG4250 Printer Drivers Install     |\e[0m"
    echo -e "                       \e[32m|  Version 1.03 - TheDarkNightmare - PulseTools   |\e[0m"
    echo -e "                       \e[32m|                                                 |\e[0m"
    echo -e "                       \e[32m|                                                 |\e[0m"
    echo -e "                       \e[32m╰─────────────────────────────────────────────────╯\e[0m"
    install_aur_helper
    echo "                       [----------------- Core Packages ----------------]"
    echo "Installing Cups and Gutenprint for basic Support..."
    sudo pacman -Syu --noconfirm cups gutenprint ghostscript
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

# ----- FastFetch -----
get_current_resolution() {
    if [ -n "$WAYLAND_DISPLAY" ] && command -v wlr-randr >/dev/null 2>&1; then
        wlr-randr --current | awk '/\*/ {print $1; exit}'
    elif command -v xrandr >/dev/null 2>&1; then
        xrandr | awk '/\*/ {print $1; exit}'
    fi
}

install_fastfetch() {
    echo -e "                       \e[34m╭─────────────────────────────────────────────────╮\e[0m"
    echo -e "                       \e[34m|                                                 |\e[0m"
    echo -e "                       \e[34m|      FastFetch - System User Configuration      |\e[0m"
    echo -e "                       \e[34m|  Version 1.06 - TheDarkNightmare - PulseTools   |\e[0m"
    echo -e "                       \e[34m|                                                 |\e[0m"
    echo -e "                       \e[34m|                                                 |\e[0m"
    echo -e "                       \e[34m╰─────────────────────────────────────────────────╯\e[0m"
    current_res="$(get_current_resolution)"
    [ -n "$current_res" ] && echo "Current display resolution: $current_res"
    sudo pacman -Syu --noconfirm fastfetch
    fastfetch --gen-config
    sleep 5
    rm ~/.config/fastfetch/config.jsonc
    if [ -d "$HOME/KWinScripts/" ]; then
        cd "$HOME/KWinScripts/"
        sleep 5
        wget -O config.jsonc https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/config.jsonc
        wget -O ARC2.png https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/ARC2.png
        cp config.jsonc ~/.config/fastfetch/
        rm config.jsonc
        sleep 5
        kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFontMono-Regular.ttf
        sleep 5
        kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFont-Regular.ttf
        echo "                       Installation complete. Please check your fastfetch settings"
    else
        echo "                       Directory $HOME/KWinScripts/ does not exist."
        read -p "                       Would you like to create the directory and download the files? (y/n): " choice
        if [ "$choice" = "y" ]; then
            mkdir -p "$HOME/KWinScripts/"
            sudo chown -R $USER "$HOME/KWinScripts"
            cd "$HOME/KWinScripts/"
            sleep 5
            wget -O config.jsonc https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/config.jsonc
            wget -O ARC2.png https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/ARC2.png
            cp config.jsonc ~/.config/fastfetch/
            rm config.jsonc
            sleep 5
            kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFontMono-Regular.ttf
            sleep 5
            kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFont-Regular.ttf
            COMMAND="fastfetch"
            if ! grep -q "$COMMAND" ~/.bashrc; then
                echo "$COMMAND" >> ~/.bashrc
                echo "Added '$COMMAND' to ~/.bashrc"
            else
                echo "'$COMMAND' is already in ~/.bashrc"
            fi
            echo "                       Installation complete. Please check your fastfetch settings"
        else
            echo "                       Exiting without making changes."
            exit 1
        fi
    fi
}

# ----- Multimedia -----
install_multimedia() {
    echo ""
    echo -e "                       \e[31m╭─────────────────────────────────────────────────╮\e[0m"
    echo -e "                       \e[31m|                                                 |\e[0m"
    echo -e "                       \e[31m|              Multimedia Package                 |\e[0m"
    echo -e "                       \e[31m|  Version 1.01 - TheDarkNightmare - PulseTools   |\e[0m"
    echo -e "                       \e[31m|                                                 |\e[0m"
    echo -e "                       \e[31m|                                                 |\e[0m"
    echo -e "                       \e[31m╰─────────────────────────────────────────────────╯\e[0m"
    install_aur_helper
    echo "                       [----------------- OBS Studio + Addons ----------------]"
    yay -S obs-studio-tytan652 obs-vkcapture obs-vaapi obs-cmd lib32-obs-vkcapture
    echo -e "                       [\e[31m----------------- Core Packages ----------------\e[0m]"
    sudo pacman -S --noconfirm firefox discord kdenlive thunderbird
    echo "                       [----------------- Spotify ----------------]"
    paru -S --noconfirm spotify
    echo "                       [----------------- Media Codecs ----------------]"
    sudo pacman -S --noconfirm x265 x264 svt-av1 libmpeg2 libvpx gst-plugins-ugly gst-plugins-va
    echo "                       [----------------- Image Programs ----------------]"
    sudo pacman -S --noconfirm gwenview gimp
    echo "                       Installation of Multimedia package complete."
}

# Allow calling functions directly when executed
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    "$@"
fi
