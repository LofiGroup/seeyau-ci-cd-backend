#!/usr/bin/env sh

apt-get update
apt-get install -y curl
apt-get install -y unzip

sh install-android.sh
sh setup-github-runner.sh
