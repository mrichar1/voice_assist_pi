#!/bin/bash

# Install deps
sudo apt-get update
sudo apt-get install --no-install-recommends -y git python3-venv libopenblas-dev

cd /home/pi

# Set up satellite
git clone https://github.com/rhasspy/wyoming-satellite.git
cd wyoming-satellite
python3 -m venv .venv
.venv/bin/pip3 install --upgrade pip
.venv/bin/pip3 install --upgrade wheel setuptools
.venv/bin/pip3 install \
  -f 'https://synesthesiam.github.io/prebuilt-apps/' \
  -r requirements.txt \
  -r requirements_audio_enhancement.txt \
  -r requirements_vad.txt
cd ..

# Set up openwakeword
git clone https://github.com/rhasspy/wyoming-openwakeword.git
cd wyoming-openwakeword
script/setup
cd ..

# Add custom media
cp beep_* /home/pi/wyoming-satellite
cp hey_alba.tflite /home/pi/wyoming-openwakeword

# Add systemd services
sudo cp wyoming-*.service /lib/systemd/system
sudo systemctl enable wyoming-*
