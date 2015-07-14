#!/bin/bash

set -ev

if [ ! -z "${ANDROID_APP1}" ]; then
	chmod -R 755 ${ANDROID_DIR}/${ANDROID_APP1_NAME}
	cd ${ANDROID_DIR}/${ANDROID_APP1_NAME}
	./gradlew build connectedCheck
fi

if [ ! -z "${ANDROID_APP2}" ]; then
	cd ${ANDROID_DIR}/${ANDROID_APP2_NAME}
	adb devices
	./gradlew build ${ANDROID_APP2}
fi
