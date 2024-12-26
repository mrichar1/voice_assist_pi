#!/bin/bash

# Run vncviewer in a GUI for connecting to: https://github.com/MindFreeze/home-assistant-addons

# Install deps
sudo apt-get install --no-install-recommends -y cage xwayland libgl1-mesa-dri libwayland-egl1-mesa mesa-vulkan-drivers tigervnc-viewer tigervnc-tools

cat << 'EOF' >> /tmp/foo # /home/pi/.profile
[ "$(tty)" == "/dev/tty1" ] && exec cage "vncviewer -passwd /home/pi/.vnc/passwd homeassistant.local::5901"
EOF

echo "Now set the vnc pasword for your HA server by running: vncpasswd\n then reboot."

