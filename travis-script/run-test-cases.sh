#!/bin/bash

set -ev

# Run Android emulator
if [ "$ANDROID_APP1" == "true" ] || [ "$ANDROID_APP2" == "true" ]; then
	# Run infer test
	./travis-script/run-infer-test.sh

	# Run android emulator
	./travis-script/run-emulator.sh

	# Run Android App 1 connectedCheck
	if [ "$ANDROID_APP1" == "true" ]; then
		cd $ANDROID_DIR/$ANDROID_PROJECT_NAME/
		./gradlew :$ANDROID_APP1_MODULE_NAME:build :$ANDROID_APP1_MODULE_NAME:connectedCheck
		cd $TRAVIS_BUILD_DIR/
	fi

	# Run Android App 2's test cases
	if [ "$ANDROID_APP2" == "true" ]; then
		cd $ANDROID_DIR/$ANDROID_PROJECT_NAME/
		./gradlew :$ANDROID_APP2_MODULE_NAME:build :$ANDROID_APP2_MODULE_NAME:connectedCheck
		cd $TRAVIS_BUILD_DIR/
	fi
fi

if [ "$NODE_JS_SERVER" == "true" ]; then
	cd Server/
	npm $NODE_JS_SERVER
	cd $TRAVIS_BUILD_DIR/
fi
