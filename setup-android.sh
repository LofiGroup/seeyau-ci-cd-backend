#!/usr/bin/env sh

FORCE_UPDATE=false
while getopts ":f" option; do
  case $option in
    f)
      FORCE_UPDATE=true;;
    \?)
      echo "Invalid option";;
  esac
done

ANDROID_HOME=/usr/local/android-sdk
CMD_TOOLS_ROOT=$ANDROID_HOME/cmdline-tools/latest

if [ ! -d "${ANDROID_HOME}" ] || [ $FORCE_UPDATE ]
then
  apt-get install -y openjdk-8-jdk

  echo "export ANDROID_HOME=$ANDROID_HOME" >> ~/.bashrc
  echo "export PATH=$PATH:$CMD_TOOLS_ROOT/bin" >> ~/.bashrc

  mkdir -p "$CMD_TOOLS_ROOT"
  curl -o commandlinetools.zip -L https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
  unzip ./commandlinetools.zip
  mv -v cmdline-tools/* "$CMD_TOOLS_ROOT"
  rm -r cmdline-tools
  rm commandlinetools.zip

  . ~/.bashrc
  sdkmanager --install "platforms;android-33"
  sdkmanager --install "build-tools;30.0.2"

  yes | sdkmanager --licenses
fi
