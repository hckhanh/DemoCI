#!/bin/bash

set -ev

# Check whether this is a tag build or not
if [ -n "$TRAVIS_TAG" ]; then

	local SERVER_RELEASE_PATH=$TRAVIS_BUILD_DIR/release-$TRAVIS_TAG/server
	local CLIENT_RELEASE_PATH=$TRAVIS_BUILD_DIR/release-$TRAVIS_TAG/client
	local RELESE_APK_ANDROID_APP1=$ANDROID_APP1_MODULE_NAME/$RELEASE_PATH_FILE/$ANDROID_APP1_MODULE_NAME-$BUILD_TYPE.apk
	local RELESE_APK_ANDROID_APP2=$ANDROID_APP2_MODULE_NAME/$RELEASE_PATH_FILE/$ANDROID_APP2_MODULE_NAME-$BUILD_TYPE.apk

	# Create client and/or server folders
	mkdir -p -v $SERVER_RELEASE_PATH
	mkdir -p -v $CLIENT_RELEASE_PATH

	cd $ANDROID_DIR/$ANDROID_PROJECT_NAME/

	# Generate release file of Android App 1
	if [ "$ANDROID_APP1" == "true" ]; then

		./gradlew :$ANDROID_APP1_MODULE_NAME:assemble$BUILD_TYPE
		mv -v $RELESE_APK_ANDROID_APP1 $CLIENT_RELEASE_PATH/$ANDROID_APP1_NAME-$TRAVIS_TAG.apk

	fi

	# Generate release file of Android App 2
	if [ "$ANDROID_APP2" == "true" ]; then
		
		./gradlew :$ANDROID_APP2_MODULE_NAME:assemble$BUILD_TYPE
		mv -v $RELESE_APK_ANDROID_APP2 $CLIENT_RELEASE_PATH/$ANDROID_APP2_NAME-$TRAVIS_TAG.apk
		
	fi

	cd $TRAVIS_BUILD_DIR/

	zip -r release-$TRAVIS_TAG.zip release-$TRAVIS_TAG/

fi
