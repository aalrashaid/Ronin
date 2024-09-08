Here’s a comprehensive guide to setting up and configuring FreeBSD with GNOME and customizing it to look like macOS, with all the necessary steps and code.

### 1. **Install FreeBSD:**
   - **Download FreeBSD ISO**: Get the latest FreeBSD installation ISO from the [FreeBSD website](https://www.freebsd.org/).
   - **Create Bootable USB**:
     ```bash
     sudo dd if=FreeBSD-13.2-RELEASE-amd64-disc1.iso of=/dev/sdX bs=4M
     ```
     Replace `/dev/sdX` with your USB drive identifier.
   - **Boot from USB** and follow the installation prompts.

### 2. **Post-Installation Setup:**
   After installing FreeBSD and logging in:

#### a. **Update Package Repository:**
   ```bash
   sudo pkg update
   ```

#### b. **Install GNOME Desktop Environment:**
   ```bash
   sudo pkg install gnome gnome-tweaks gdm
   ```

#### c. **Enable GNOME Services:**
   ```bash
   sudo sysrc gdm_enable="YES"
   sudo sysrc gnome_enable="YES"
   ```

#### d. **Start GNOME Display Manager (GDM):**
   ```bash
   sudo service gdm start
   ```
To ensure that you can execute your `install.sh` script during the customization of GNOME to look like macOS, you should include steps to set the correct permissions for the script. Here’s the revised step-by-step guide:

### 3. **Customize GNOME to Look Like macOS:**

#### a. **Install macOS-Like Themes and Icons:**

1. **Download and Install WhiteSur Theme:**
   ```bash
   git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
   cd WhiteSur-gtk-theme
   chmod +x ./install.sh
   ./install.sh
   ```

2. **Download and Install WhiteSur Icons:**
   ```bash
   git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
   cd WhiteSur-icon-theme
   chmod +x ./install.sh
   ./install.sh
   ```

   **Note:** Using `chmod +x ./install.sh` ensures that the `install.sh` script has executable permissions.

3. **Apply Theme and Icons:**
   ```bash
   gnome-tweaks
   ```
   In GNOME Tweaks, select the WhiteSur theme and WhiteSur icons under "Appearance."

#### b. **Install and Configure Plank (Optional Dock):**
   ```bash
   sudo pkg install plank
   plank &
   ```

   Add Plank to startup applications if needed to ensure it runs automatically on login.

#### c. **Install GNOME Extensions for macOS-Like Functionality:**

1. **Install AppIndicator Extension:**
   ```bash
   sudo pkg install gnome-shell-extension-appindicator
   ```

2. **Install No Title Bar Extension:**
   ```bash
   sudo pkg install gnome-shell-extension-no-title-bar
   ```

3. **Install Dash to Dock Extension:**
   ```bash
   sudo pkg install gnome-shell-extension-dash-to-dock
   ```

4. **Enable Extensions:**
   Visit the [GNOME Extensions website](https://extensions.gnome.org/) and enable the extensions you’ve installed or use the GNOME Extensions application.

#### d. **Set Up Fonts:**

1. **Install San Francisco Fonts:**
   ```bash
   git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
   mkdir -p ~/.local/share/fonts
   cp YosemiteSanFranciscoFont/*.ttf ~/.local/share/fonts/
   fc-cache -f -v
   ```

### 4. **Create and Run Installation Script:**

To automate the setup process, you can create and run a script. Here’s the updated script that includes setting executable permissions:

```bash
#!/bin/sh
# Update FreeBSD package repository
sudo pkg update

# Install GNOME desktop
sudo pkg install -y gnome gnome-tweaks gdm plank

# Enable GNOME and GDM services
sudo sysrc gdm_enable="YES"
sudo sysrc gnome_enable="YES"

# Install WhiteSur theme and icons
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
chmod +x ./install.sh
./install.sh

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd ../WhiteSur-icon-theme
chmod +x ./install.sh
./install.sh

# Install GNOME extensions
sudo pkg install -y gnome-shell-extension-appindicator gnome-shell-extension-no-title-bar gnome-shell-extension-dash-to-dock

# Apply theme and icon using GNOME Tweaks
gnome-tweaks

# Start GDM service
sudo service gdm start
```

Make the script executable and run it:
```bash
chmod +x setup.sh
./setup.sh
```

This comprehensive guide now includes ensuring executable permissions for installation scripts and provides a complete setup for customizing GNOME to resemble macOS. If you encounter any issues or need further assistance, feel free to ask!