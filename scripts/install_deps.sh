#!/usr/bin/bash

clear

ICONS_DIR="~/.icons/"
SECOND_ICONS_DIR="~/.local/share/icons"
THEMES_DIR="~/.themes/"

function print_message {
    echo "██████                          ██████                   █████                                      "
    echo "█    ██                      █  █    ██                  █   ██                                     "
    echo "█    ██  ████  ██   █   █████   █    ██  ████ █      █   █   ██  ██    █     ███  █  ██  ████ ████  "
    echo "█    ██  █  █  ██ █████ █   █   █    ██  █  █ █      █   █   ██ █  █ █████   █       ██  █  █ █     "
    echo "█    ██  ████  ██   █   █   █   █    ██  ████  █    █    █   ██ █  █   █   █████  █  ██  ████ ████  "
    echo "█    ██  █     ██   █   █   █   █    ██  █      █  █     █   ██ █  █   █     █    █  ██  █       █  "
    echo "██████   ████  ██   ██  ███████ ██████   ███     ██      ████    ██    ███   █    █  ██  ███  ████  "
    echo "                  "
    echo "Artix Linux gruvbox hyprland setup"
    echo "This setup for base tty system!!!"
}

function install_deps {
    while true; do
        echo "starting script for installing dependencies: (y/n) "
        read start 

        if [ "$start" == "y" ]; then 
            echo "installing dependencies"
            
            echo "installing wget and curl"
            sudo pacman -S wget curl 

            echo "installing fonts"
            sudo pacman -S ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono 
            sudo pacman -S ttf-jetbrains-mono ttf-jetbrains-mono-nerd
            
            echo "installing utils for screenshots"
            sudo pacman -S grim slurp 

            echo "installing base utils"
            
            if [ $(sudo pacman -Q | grep -E 'xorg|wayland') &> /dev/null ]; then 
                continue 
            else 
                sudo pacman -S xorg-server xorg-server-common xorg-server-devel
                sudo pacman -S xorg-xwayland
                sudo pacman -S wayland waylandpp wayland-protocols wayland-utils 
            fi 
            
            sudo pacman -S hyprland hyprland-guiutils hyprland-protocols hyprland-qt-support
            sudo pacman -S hyprgraphics hyprcursor hyprpicker hyprlang 
            sudo pacman -S swaylock swaybg swaync 
            sudo pacman -S wofi waybar 
            sudo pacman -S vim neovim lua 
            sudo pacman -S wireplumber pipewire alsa-utils pipewire-pulse pipewire-alsa pipewire-audio
            
            if [ $(sudo pacman -Q | grep -E 'networkmanager|network-manager-applet') &> /dev/null ]; then 
                echo "network manager is installed!"
                continue
            elif [ $(sudo pacman -Q | grep -E 'blueman|bluez|bluez-utils') &> /dev/null ]; then 
                echo "blueman and bluez is installed!"
                continue 
            elif [ $(sudo pacman -Q | grep -E 'git') &> /dev/null ]; then 
                echo "git is installed!"
                continue 
            else 
                echo "installing git and utils for network and bluetooth"
                sudo pacman -S networkmanager network-manager-applet
                sudo pacman -S blueman bluez bluez-utils
                sudo pacman -S git 
            fi 

            echo "installing fish shell and tide theme"
            sudo pacman -S fish 
            curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
            fisher install IlanCosman/tide
            
            echo "installing other utils"
            sudo pacman -S fastfetch btop cava htop 
            sudo pacman -S yazi zoxide eza bat tree duf 

            echo "installing Gruvbox global theme"
            git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme
            cd ~/Gruvbox-GTK-Theme/
            
            if [ -d "$THEMES_DIR" ]; then 
                cd ~/Gruvbox-GTK-Theme/themes/
                ./install.sh -n Gruvbox -t orange -c dark -s standard -l --tweaks macos black
            elif [ -d "$ICONS_DIR" ]; then 
                cd ~/Gruvbox-GTK-Theme/icons/
                cp -r gruvbox_dark ~/.icons/
                gsettings set org.gnome.desktop.interface icon-theme 'gruvbox_dark'
            elif [ -d "$SECOND_ICONS_DIR" ]; then 
                cd ~/Gruvbox-GTK-Theme/icons/
                cp -r gruvbox_dark ~/.local/share/icons 
                gsettings set org.gnome.desktop.interface icon-theme 'gruvbox_dark'
            else 
                echo "directory '$THEMES_DIR' is not found!"
                echo "directory '$ICONS_DIR' is not found!"
                echo "directory '$SECOND_ICONS_DIR' is not found!"
            fi 

            echo "installing plug.vim"
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

            echo "all dependencies is installing!!!"
        elif [ "$start" == "n" ]; then 
            echo "script is not starting"
            break 
        else 
            echo "choose only y or n"
        fi 
    done 
}

print_message
install_deps
