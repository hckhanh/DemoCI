#!/bin/bash

set -e

# Run infer test
cd ..
cd Client/Client.Android/DemoApp1/
infer -- ./gradlew build
cd ../DemoApp2/
infer -- ./gradlew build
cd ../../../
