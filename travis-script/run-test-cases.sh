#!/bin/bash

set -ev

# Run Android emulator
if [ "$ANDROID_APP1" == "true" ] || [ "$ANDROID_APP2" == "true" ]; then
	
	# Run infer test
	./travis-script/run-infer-test.sh

	# Run android emulator
	./travis-script/run-emulator.sh

	cd $ANDROID_DIR/$ANDROID_PROJECT_NAME/

	# Run connectedCheck of Android App 1
	if [ "$ANDROID_APP1" == "true" ]; then
		./gradlew :$ANDROID_APP1_MODULE_NAME:assembleDebug :$ANDROID_APP1_MODULE_NAME:connectedCheck
	fi

	# Run connectedCheck of Android App 2
	if [ "$ANDROID_APP2" == "true" ]; then
		./gradlew :$ANDROID_APP2_MODULE_NAME:assembleDebug :$ANDROID_APP2_MODULE_NAME:connectedCheck
	fi

	cd $TRAVIS_BUILD_DIR/

fi

if [ "$NODE_JS_SERVER" == "true" ]; then
	cd Server/
	npm $NODE_JS_SERVER
	cd $TRAVIS_BUILD_DIR/
fi
