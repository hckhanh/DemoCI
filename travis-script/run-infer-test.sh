#!/bin/bash

set -ev

# Run infer test
cd $ANDROID_DIR/$ANDROID_APP1_NAME/
infer -- ./gradlew build
cd ../$ANDROID_APP2_NAME/
infer -- ./gradlew build
cd $TRAVIS_BUILD_DIR/
