#!/bin/bash

set -ev

# Run emulator
echo no | android create avd --force -n test -t $ANDROID_API --abi $ANDROID_TARGET
emulator -avd test -no-skin -no-audio -no-window &
android-wait-for-emulator
adb shell input keyevent 82 &
