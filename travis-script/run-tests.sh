#!/bin/bash

set -ev

if [ ! -z "${ANDROID_APP1}" ]; then
	cd ${ANDROID_DIR}/${ANDROID_APP1_NAME}
	echo "Run test \$ANDROID_APP1: '$ANDROID_APP1' ${ANDROID_APP1}"
	./gradlew build ${ANDROID_APP1}
fi

if [ ! -z "${ANDROID_APP2}" ]; then
	cd ${ANDROID_DIR}/${ANDROID_APP2_NAME}
	./gradlew build ${ANDROID_APP2}
fi
