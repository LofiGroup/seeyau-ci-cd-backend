#!/usr/bin/env sh

if [ ! -d "${ANDROID_HOME}" ]
then
  apt-get install -y openjdk-8-jdk

  export ANDROID_HOME=/usr/local/android-sdk
  export CMD_TOOLS_ROOT=$ANDROID_HOME/cmdline-tools/latest

  echo "export ANDROID_HOME=$ANDROID_HOME" >> ~/.bashrc
  echo "export PATH=$PATH:$CMD_TOOLS_ROOT/bin" >> ~/.bashrc

  mkdir -p "$CMD_TOOLS_ROOT"
  curl -o commandlinetools.zip -L https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
  unzip ./commandlinetools.zip
  mv -v cmdline-tools/* "$CMD_TOOLS_ROOT"
  rm -r cmdline-tools
  rm commandlinetools.zip

  cd $CMD_TOOLS_ROOT/bin || exit 1
  sdkmanager --install "platforms;android-33"
  sdkmanager --install "build-tools;30.0.2"

  yes | sdkmanager --licenses
fi
