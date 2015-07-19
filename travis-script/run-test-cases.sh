#!/bin/bash

set -ev

# Run Android emulator
if [ ! -z "${ANDROID_APP1}" ] || [ ! -z "${ANDROID_APP2}" ]; then
	# Run infer test
	./travis-script/run-infer-test.sh

	# Run android emulator
	./travis-script/run-emulator.sh

	# This is not correct, yet.
	if [ ! -z "${ANDROID_APP1}" ]; then
		cd $ANDROID_DIR/$ANDROID_APP1_NAME/
		./gradlew $ANDROID_APP1
		cd $TRAVIS_BUILD_DIR/
	fi

	if [ ! -z "${ANDROID_APP2}" ]; then
		cd $ANDROID_DIR/$ANDROID_APP2_NAME/
		./gradlew $ANDROID_APP2
		cd $TRAVIS_BUILD_DIR/
	fi
fi

if [ ! -z "${NODE_JS_SERVER}" ]; then
	cd Server/
	npm $NODE_JS_SERVER
fi
