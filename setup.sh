#!/usr/bin/env sh

apt-get update
apt-get install -y curl
apt-get install -y unzip

chmod +x ./install-android.sh
./install-android.sh

chmod +x ./setup-github-runner.sh
./setup-github-runner.sh
