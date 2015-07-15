#!/bin/bash

set -ev

# Run infer test
ls
cd Client/Client.Android/DemoApp1/
infer -- ./gradlew build
cd ../DemoApp2/
infer -- ./gradlew build
cd ../../../
