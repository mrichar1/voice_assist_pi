#!/bin/bash

# Run vncviewer in a GUI for connecting to: https://github.com/MindFreeze/home-assistant-addons

# Enable autologin on tty1
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
cat << 'EOF' > /etc/systemd/system/getty@tty1.service.d/autologin.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin pi --noclear %I $TERM
EOF

# Install deps
sudo apt-get install --no-install-recommends -y cage xwayland libgl1-mesa-dri libwayland-egl1-mesa mesa-vulkan-drivers tigervnc-viewer tigervnc-tools

cat << 'EOF' >> /home/pi/.profile
export XKB_DEFAULT_LAYOUT=gb
[ "$(tty)" == "/dev/tty1" ] && exec cage -s -- vncviewer -passwd /home/pi/.vnc/passwd homeassistant.local::5901
EOF

echo "Now set the vnc pasword for your HA server by running: vncpasswd\n then reboot."

