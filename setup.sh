#!/usr/bin/env sh

apt-get update
apt-get install -y curl
apt-get install -y unzip

sh -c ./install-android.sh
sh -c ./setup-github-runner.sh
