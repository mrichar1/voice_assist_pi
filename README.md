Set up a Voice Assistant Satellite on a RPi (Zero 2 W or better)

# Setup

1. Write the Raspbian Lite image (32-bit for Z2 W) to sd card. (https://www.raspberrypi.com/software/operating-systems/)
2. Boot Pi, follow prompts to set password.
3. Use raspi-config to set wifi country and add wireless connection.
4. Clone this repo.
5. Add Extra Wake word models and/or sound files to the repo.
6. Optionally change config (see below).'name' setting in wyoming-satellite.service
7. Run install.sh and install-vncviewer.sh
8. Reboot.

# Config options

## wyoming-satellite.service

* Satellite `name`
* `aplay` and `arecord` devices.
* `wake-wav`, `done-wav` and `wake-word-name`.

