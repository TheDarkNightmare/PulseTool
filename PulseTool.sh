#!/bin/bash

# Source the style and function files
source ./styles.sh
source ./src/base-package.sh
source ./src/multimedia.sh
source ./src/cannon.sh
source ./src/game.sh
source ./src/fastfetch.sh

# Display the title
#echo -e "$TITLE"



# Main menu options
while true; do

    MainTitle
    
    echo -e "                                        Choose an option:"
    echo -e "                          1) \e[31mMedia\e[0m"
    echo -e "                          2) \e[32mCannon Printer\e[0m"
    echo -e "                          3) \e[33mGame Ready\e[0m"
    echo -e "                          4) \e[34mFastFetch\e[0m"
    echo -e "                          5) Exit"
    read -p "                                      Enter your choice: " choice

    case $choice in
        1) install_multimedia ;;
        2) install_cannon ;;
        3) install_game ;;
        4) install_fastfetch ;;
        5) exit ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
