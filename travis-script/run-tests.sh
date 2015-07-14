#!/bin/bash

set -ev

if [ ! -z "${ANDROID_APP1}" ]; then
	cd ${ANDROID_DIR}/${ANDROID_APP1_NAME}
	./gradlew build ANDROID_APP1
fi
