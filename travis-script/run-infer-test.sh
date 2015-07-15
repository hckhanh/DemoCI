#!/bin/bash

set -ev

# Run infer test
cd Client/Client.Android/DemoApp1/
infer -- ./gradlew build
cd ../DemoApp2/
infer -- ./gradlew build
cd ../../../
