#!/bin/bash

set -ev

# Run Android emulator
./travis-script/run-emulator.sh

if [ ! -z "${ANDROID_APP1}" ]; then
	cd ${ANDROID_DIR}/${ANDROID_APP1_NAME}
	./gradlew build ${ANDROID_APP1}
fi

if [ ! -z "${ANDROID_APP2}" ]; then
	cd ${ANDROID_DIR}/${ANDROID_APP2_NAME}
	./gradlew build ${ANDROID_APP2}
fi
