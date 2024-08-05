#!/bin/bash

install_fastfetch() {
    echo -e "                       \e[34m╭─────────────────────────────────────────────────╮\e[0m"
    echo -e "                       \e[34m|                                                 |\e[0m"
    echo -e "                       \e[34m|      FastFetch - System User Configuration      |\e[0m"
    echo -e "                       \e[34m|  Version 1.06 - TheDarkNightmare - PulseTools   |\e[0m"
    echo -e "                       \e[34m|                                                 |\e[0m"
    echo -e "                       \e[34m|                                                 |\e[0m"
    echo -e "                       \e[34m╰─────────────────────────────────────────────────╯\e[0m"

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

        echo "                       Installation complete. Please check your fastfetch settings"
    else
        echo "                       Directory $HOME/KWinScripts/ does not exist."
        read -p "                       Would you like to create the directory and download the files? (y/n): " choice
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

            echo "                       Installation complete. Please check your fastfetch settings"
        else
            echo "                       Exiting without making changes."
            exit 1
        fi
    fi
}
