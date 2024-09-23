#!/bin/bash

# Define color variables using tput
TITLE_COLOR=$(tput setaf 1)
BORDER_COLOR=$(tput setaf 2)
TEXT_COLOR=$(tput setaf 7)
RESET_COLOR=$(tput sgr0)

# Define styles
TITLE="${TITLE_COLOR}╭────────────────────────────────────────────────╮
|                                                |
|                                                |
|                                                |
|                                                |
|                                                |
╰────────────────────────────────────────────────╯${RESET_COLOR}"










MainTitle(){
	echo -e "\e[1;31m         /\ \e[0m            \e[1;32m                                                  \e[0m           \e[1;31m/\  \e[0m"   
	echo -e "\e[1;31m         __\e[0m            \e[1;32m                                                   \e[0m           \e[1;31m__  \e[0m"      
    echo -e "\e[1;31m        (**)\e[0m           \e[1;32m                                                   \e[0m          \e[1;31m(**) \e[0m"
    echo -e "\e[1;31m        IIII\e[0m           \e[1;32m                                                  \e[0m           \e[1;31mIIII\e[0m"
    echo -e "\e[1;31m        ####\e[0m           \e[1;32m                                                   \e[0m          \e[1;31m####\e[0m"
    echo -e "\e[1;31m        HHHH\e[0m           \e[1;32m╭─────────────────────────────────────────────────╮\e[0m          \e[1;31mHHHH\e[0m"
    echo -e "\e[1;31m        HHHH\e[0m           \e[1;32m|                                                 |\e[0m          \e[1;31mHHHH\e[0m"
    echo -e "\e[1;31m        ####\e[0m           \e[1;32m|       PulseTools Installer - ArchLinux          |\e[0m          \e[1;31m####\e[0m"
    echo -e "\e[1;31m    <___IIII___>\e[0m       \e[1;32m|       Version 1.01 - TheDarkNightmare           |\e[0m      \e[1;31m<___IIII___>\e[0m"
    echo -e "\e[1;31m       ******\e[0m          \e[1;32m|                                                 |\e[0m         \e[1;31m******\e[0m\e[0m"
    echo -e "\e[1;31m       |    |\e[0m          \e[1;32m|  https://github.com/TheDarkNightmare/PulseTool  |\e[0m         \e[1;31m|    |\e[0m"
    echo -e "\e[1;31m       }    {\e[0m          \e[1;32m|                                                 |\e[0m         \e[1;31m}    {\e[0m"
    echo -e "\e[1;31m       ) () (\e[0m          \e[1;32m╰─────────────────────────────────────────────────╯\e[0m         \e[1;31m) () (\e[0m"
    echo -e "\e[1;31m       ( :: )\e[0m          \e[1;32m                                                   \e[0m         \e[1;31m( :: )\e[0m"
    echo -e "\e[1;31m       | :: |\e[0m        \e[1;32mPulseTool is OpenSource script in bash for Arch Linux (KDE)\e[0m   \e[1;31m| :: |\e[0m"
    echo -e "\e[1;31m       | )( |\e[0m   \e[1;32mIts a installer in CLI for fresh installations of Linux on KDE\e[0m     \e[1;31m| )( |\e[0m"
    echo -e "\e[1;31m       | || |\e[0m          \e[1;32m   ─────────────────────────────────────────────\e[0m            \e[1;31m| || |\e[0m"
    echo -e "\e[1;31m       | || |\e[0m          \e[1;32m          Currently PulseTool support for:            \e[0m      \e[1;31m| || |\e[0m"
    echo -e "\e[1;31m       | || |\e[0m          \e[1;32m                   Media Package              \e[0m              \e[1;31m| || |\e[0m"
    echo -e "\e[1;31m       | || |\e[0m          \e[1;32m                   Game Package               \e[0m              \e[1;31m| || |\e[0m"
    echo -e "\e[1;31m       | || |\e[0m          \e[1;32m                     FastFetch                \e[0m              \e[1;31m| || |\e[0m"
    echo -e "\e[1;31m       ( () )\e[0m          \e[1;32m         Cannon MG4250 Printer Driver         \e[0m              \e[1;31m( () )\e[0m"
    echo -e "\e[1;31m        \  /\e[0m           \e[1;32m   ─────────────────────────────────────────────\e[0m             \e[1;31m\  /\e[0m"
    echo -e "\e[1;31m         \/\e[0m            \e[1;32m                                                   \e[0m           \e[1;31m\/\e[0m"
    echo -e "                                                 "
    echo -e "                                                 "
    echo -e "                                         \e[31m󰹞\e[0m \e[32m󰹞\e[0m \e[33m󰹞\e[0m \e[34m󰹞\e[0m \e[35m󰹞\e[0m \e[36m󰹞\e[0m \e[37m󰹞\e[0m"

}

