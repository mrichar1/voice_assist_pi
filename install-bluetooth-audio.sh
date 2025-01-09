#!/bin/bash

# Setup bluetooth alsa support
sudo apt install -y --no-install-recommends bluez-alsa-utils

echo 'BLUETOOTH_MACS=""' | sudo tee /etc/default/bt-connect
sudo cp bt-connect.service /lib/systemd/system

sudo systemctl daemon-reload
sudo systemctl enable bt-connect

# Run snapclient to receive streamed audio from HA
sudo apt install -y --no-install-recommends snapclient

cat << 'EOF' | sudo tee /etc/default/snapclient
SNAPCLIENT_OPTS="-s bluealsa"
EOF

echo "Add the MAC addresses (space-separated) of BT audio devices to /etc/default/bt-connect, then reboot."

