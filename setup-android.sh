#!/usr/bin/env sh

if [ ! -d "${ANDROID_HOME}" ]
then
  apt-get install -y openjdk-8-jdk

  export ANDROID_HOME=/usr/local/android-sdk
  export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest"

  mkdir -p "$ANDROID_HOME"/cmdline-tools/latest
  curl -o commandlinetools.zip -L https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
  unzip ./commandlinetools.zip
  mv -v cmdline-tools/* "$ANDROID_HOME"/cmdline-tools/latest
  rm cmdline-tools
  rm commandlinetools.zip

  sdkmanager --install "platforms;android-33"
  sdkmanager --install "build-tools;30.0.2"

  yes | sdkmanager --licenses
fi
