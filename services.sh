#!/bin/sh

# Configure Network and dbus

sudo rm /var/service/wpa_supplicant
sudo rm /var/service/dhcpcd
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/dbus /var/service/
