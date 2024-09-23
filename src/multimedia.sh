#!/bin/bash

install_multimedia() {
    echo ""
    echo -e "                       \e[31m╭─────────────────────────────────────────────────╮\e[0m"
    echo -e "                       \e[31m|                                                 |\e[0m"
    echo -e "                       \e[31m|              Multimedia Package                 |\e[0m"
    echo -e "                       \e[31m|  Version 1.01 - TheDarkNightmare - PulseTools   |\e[0m"
    echo -e "                       \e[31m|                                                 |\e[0m"
    echo -e "                       \e[31m|                                                 |\e[0m"
    echo -e "                       \e[31m╰─────────────────────────────────────────────────╯\e[0m"

    # Install yay if not installed
    install_yay

    echo "                       [----------------- OBS Studio + Addons ----------------]"
    yay -S obs-studio-tytan652 obs-vkcapture obs-vaapi obs-cmd lib32-obs-vkcapture

    echo -e "                       [\e[31m----------------- Core Packages ----------------\e[0m]"
    sudo pacman -S --noconfirm firefox discord kdenlive thunderbird

    echo "                       [----------------- Video Capture Fix ----------------]"
    sudo pacman -S --noconfirm xwaylandvideobridge

    echo "                       [----------------- Spotify ----------------]"
    yay -S --noconfirm spotify

    echo "                       [----------------- Media Codecs ----------------]"
    sudo pacman -S --noconfirm x265 x264 svt-av1 libmpeg2 libvpx gst-plugins-ugly gst-plugins-va

    echo "                       [----------------- Image Programs ----------------]"
    sudo pacman -S --noconfirm gwenview gimp spectacle

    echo "                       Installation of Multimedia package complete."
}
