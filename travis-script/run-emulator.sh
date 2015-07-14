#!/bin/bash

set -e

# Run emulator
echo no | android create avd --force -n test -t ${ANDROID_API} --abi ${ANDROID_TARGET}
android-wait-for-emulator
adb shell input keyevent 82 &
