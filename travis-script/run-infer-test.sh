#!/bin/bash

set -ev

# Run infer test
cd $ANDROID_DIR/$ANDROID_PROJECT_NAME/
chmod ugo+x ./gradlew
infer -- ./gradlew :$ANDROID_APP1_MODULE_NAME:build
cd $TRAVIS_BUILD_DIR/
