FROM jenkins/jenkins:lts-jdk11

RUN USER root
RUN apt-get update
RUN apt-get install -y unzip
RUN apt-get install -y curl
RUN apt-get install openjdk-11-jdk

ENV ANDROID_HOME=/usr/local/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

RUN mkdir -p "$ANDROID_HOME"/cmdline-tools/latest
RUN curl -o android-cmdline.zip https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
RUN unzip android-cmdline.zip
RUN mv -v android-cmdline/* "$ANDROID_HOME"/cmdline-tools/latest
RUN rm android-cmdline.zip
RUN rm -r android-cmdline

RUN USER jenkins


