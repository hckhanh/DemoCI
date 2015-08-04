#!/bin/bash

set -ev

# Check whether this is a tag build or not
if [ -n "$TRAVIS_TAG" ]; then

	# Generate Android App 1's relesae file
	if [ "$ANDROID_APP1" == "true" ]; then
		cd $ANDROID_DIR/$ANDROID_PROJECT_NAME/
		./gradlew :$ANDROID_APP1_MODULE_NAME:assemble$BUILD_TYPE
		cd $ANDROID_APP2_MODULE_NAME/$RELEASE_PATH_FILE/
		mv $ANDROID_APP1_MODULE_NAME-$BUILD_TYPE.apk $ANDROID_APP1_NAME-$TRAVIS_TAG.apk
		cd $TRAVIS_BUILD_DIR/
	fi

	# Generate Android App 2's relesae file
	if [ "$ANDROID_APP2" == "true" ]; then
		cd $ANDROID_DIR/$ANDROID_PROJECT_NAME/
		./gradlew :$ANDROID_APP2_MODULE_NAME:assemble$BUILD_TYPE
		cd $ANDROID_APP2_MODULE_NAME/$RELEASE_PATH_FILE/
		mv $ANDROID_APP2_MODULE_NAME-$BUILD_TYPE.apk $ANDROID_APP2_NAME-$TRAVIS_TAG.apk
		cd $TRAVIS_BUILD_DIR/
	fi
	
fi
