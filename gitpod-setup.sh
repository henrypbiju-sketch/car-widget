#!/bin/bash

set -e

ANDROID_SDK_ROOT=/workspace/android-sdk
mkdir -p $ANDROID_SDK_ROOT
mkdir -p ~/.android

echo "Installing Android Command Line Tools..."

cd /workspace
wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmd.zip
unzip -q cmd.zip -d $ANDROID_SDK_ROOT/
rm cmd.zip

mkdir -p $ANDROID_SDK_ROOT/cmdline-tools/latest
mv $ANDROID_SDK_ROOT/cmdline-tools/* $ANDROID_SDK_ROOT/cmdline-tools/latest/

export ANDROID_SDK_ROOT
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

echo "Installing Android platform + build-tools..."

yes | sdkmanager --licenses
sdkmanager "platforms;android-34" "build-tools;34.0.0" "platform-tools"

echo "Android SDK setup complete!"
