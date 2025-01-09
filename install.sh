#!/bin/bash

# Install deps
sudo apt-get update
sudo apt-get install --no-install-recommends -y git python3-venv libopenblas-dev zram-tools

mkdir /home/pi/voice_media /home/pi/voice_models
# Add custom media
cp *.wav /home/pi/voice_media/
cp *.tflite /home/pi/voice_models/

# Add systemd services
sudo cp wyoming.service /lib/systemd/system

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

sudo systemctl daemon-reload
sudo systemctl enable wyoming-satellite #wyoming-openwakeword
sudo systemctl start wyoming-satellite #wyoming-openwakeword

