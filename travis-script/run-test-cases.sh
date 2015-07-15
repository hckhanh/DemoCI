#!/bin/bash

set -ev

# Run Android emulator
if [ ! -z "${ANDROID_APP1}" ] || [ ! -z "${ANDROID_APP2}" ]; then
	# Run infer test
	./travis-script/run-infer-test.sh
	# Run android emulator
	./travis-script/run-emulator.sh

	if [ ! -z "${ANDROID_APP1}" ]; then
		cd ${ANDROID_DIR}/${ANDROID_APP1_NAME}
		./gradlew build ${ANDROID_APP1}
	fi

	if [ ! -z "${ANDROID_APP2}" ]; then
		cd ${ANDROID_DIR}/${ANDROID_APP2_NAME}
		./gradlew build ${ANDROID_APP2}
	fi
fi

if [ ! -z "${NODE_JS_SERVER}" ]; then
	cd Server/
	npm install
	npm ${NODE_JS_SERVER}
fi
