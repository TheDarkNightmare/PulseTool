# This is a comment explaining what the script does
# It installs various packages and components for gaming on Arch Linux

install_game() {
    # This function contains the main installation logic
    echo -e "                       \e[33m╭─────────────────────────────────────────────────╮\e[0m"
    echo -e "                       \e[33m|                                                 |\e[0m"
    echo -e "                       \e[33m|            Game Ready Packages - Arch           |\e[0m"
    echo -e "                       \e[33m|                 Version 1.02                    |\e[0m"
    echo -e "                       \e[33m|                                                 |\e[0m"
    echo -e "                       \e[33m|                                                 |\e[0m"
    echo -e "                       \e[33m╰─────────────────────────────────────────────────╯\e[0m"

    # Install yay if not installed
    install_yay

    echo "                       [----------------- Core Packages ----------------]"
    # Install Steam Client Standalone 
    # Fix 0.1 Installing Steam with noconfirm attribute break Steam package and game performace due to auto install lib32-files dependecies auto not reflecting current video driver installed.
    # After fix user can choose lib32 package according to his Video Driver eg. (AMD , NVIDIA , INTEL).
    echo "Installing Steam Client for Arch Linux ...."
    sudo pacman -S steam && echo "Steam package installed."

   
    echo "Installing additional packages ......."

     # Install Lutris
    sudo pacman -S --noconfirm steam lutris && echo "Lutris packages installed."

    echo "                       [----------------- ProtonUP-QT ----------------]"
    # Install ProtonUP-QT allowing user to install Proton/Wine wersions of runners for there games and Programs like (Lutris, Bottles, Steam)
    yay -S --noconfirm protonup-qt && echo "ProtonUP-QT package installed."

    echo "                       [----------------- Vulkan Game Monitor Statistics  ----------------]"
    # Install MangoHud for 64 lib + 32 lib + Goverlay Settings 
    # Installing a MangoHud will not automatic set to showing a statistic in system
    # Adding new option to Enable ManhoHud Globaly without depend of Goverlay Program.
    echo "Installing MangoHud and Goverlay packages ...."

    yay -S --noconfirm goverlay mangohud lib32-mangohud

    # MangoHud globaly switch for user system settings.
    echo 'export MANGOHUD=1' >> ~/.bashrc


    echo "                       [----------------- Bottles GUI Container ----------------]"
    # Install Bottles Container for Linux Games and Programs.
    yay -S --noconfirm bottles && echo "Bottles package installed."

    # Install Custom Wine TKG
    echo "                       [----------------- WineTKG ----------------]"
    git clone https://github.com/Frogging-Family/wine-tkg-git
    cd wine-tkg-git
    cd wine-tkg-git

    echo "                       [----------------- Compiling Wine TKG  ----------------]"
    makepkg -si --noconfirm && echo "Wine-TKG package installed."


    # Cleaning downloaded files for extra space
    cd ..
    rm -rf wine-tkg-git

    # Booting wine with first setup and creating Mono Instance
    echo "Prepearing WINE for user ......"
    sleep 5

    winecfg

    # Installing prefix and wine settings handler GUI / Winetricks
    echo "Installing Winetricks GUI control for wine prefixes...."
    sudo pacman -S --noconfirm winetricks




    # Print a message indicating that the installation is complete
    echo "                       Installation complete."
}
