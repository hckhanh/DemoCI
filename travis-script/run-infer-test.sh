#!/bin/bash

set -ev

# Run infer test
cd $ANDROID_DIR/$ANDROID_PROJECT_NAME/
chmod ugo+x ./gradlew
infer -- ./gradlew build
cd $TRAVIS_BUILD_DIR/
