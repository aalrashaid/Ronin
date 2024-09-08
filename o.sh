#!/bin/sh
# Define the directory for GitHub repositories
GITHUB_DIR=~/Github

# Create the directory if it doesn't exist
mkdir -p $GITHUB_DIR

# Update FreeBSD package repository
sudo pkg update

# Install GNOME desktop
sudo pkg install -y gnome gnome-tweaks gdm plank

# Enable GNOME and GDM services
sudo sysrc gdm_enable="YES"
sudo sysrc gnome_enable="YES"

# Change to the GitHub directory
cd $GITHUB_DIR

# Install WhiteSur theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
chmod +x ./install.sh
./install.sh

# Go back to the GitHub directory
cd $GITHUB_DIR

# Install WhiteSur icons
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme
chmod +x ./install.sh
./install.sh

# Go back to the home directory
cd

# Install GNOME extensions
sudo pkg install -y gnome-shell-extension-appindicator gnome-shell-extension-no-title-bar gnome-shell-extension-dash-to-dock

# Apply theme and icon using GNOME Tweaks
gnome-tweaks

# Start GDM service
sudo service gdm start
