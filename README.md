Set up a Voice Assistant Satellite on a RPi (Zero 2 W or better)

# Setup

1. Write the Raspbian Lite image to the SD card(64-bit needed for wyoming). (https://www.raspberrypi.com/software/operating-systems/): xzcat foo.img >/dev/sda
2. Boot Pi, follow prompts to set password, locale etc.
3. Use raspi-config to setup wireless.
4. Clone this repo: sudo apt install -y git && git clone ...
5. Add Extra wakeword models and/or sound files to the repo root.
6. Optionally change config (see below).
7. Run install.sh (and install-vncviewer.sh if needed).
8. Reboot.

# Config options

## wyoming-satellite.service

* Satellite `name`
* `aplay` and `arecord` devices.
* `wake-wav`, `done-wav` and `wake-word-name`.

