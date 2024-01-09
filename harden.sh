#!/bin/bash

# Harden Macbook Air By Taylor Christian Newsome

# Enable FileVault (Full Disk Encryption)
sudo fdesetup enable

# Set a firmware password
sudo firmwarepasswd -setpasswd -mode command -setmode command

# Enable Firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Disable remote login (SSH)
sudo systemsetup -f -setremotelogin off

# Disable automatic login
sudo defaults write /Library/Preferences/com.apple.loginwindow DisableFDEAutoLogin -bool YES

# Enable Gatekeeper (Allow apps from the App Store and identified developers)
sudo spctl --master-enable

# Enable automatic updates
sudo softwareupdate --schedule on

# Set a screen lock with password (Note: This step must be done manually)
echo "Please go to System Preferences > Security & Privacy > General and enable 'Require password [time] after sleep or screen saver begins'"

# Disable guest user
sudo dscl . -create /Users/Guest UserShell /usr/bin/false
sudo dscl . -create /Users/Guest RealName "Guest User"
sudo dscl . -create /Users/Guest UniqueID 600
sudo dscl . -create /Users/Guest PrimaryGroupID 201
sudo dscl . -create /Users/Guest NFSHomeDirectory /Library/Guests
sudo dscl . -create /Users/Guest IsHidden 1

# Disable unnecessary services and ports (Manual review and disable if not needed)

# Review and adjust sharing settings (Manual review and enable only necessary services)
echo "Please go to System Preferences > Sharing and enable only necessary services."

echo "Security hardening complete. Please review each change to ensure it aligns with your requirements."
