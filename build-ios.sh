#!/bin/bash

set -e
mode=Release
suffix=""

if [ "$1" == "debug" ]; then
    mode=Debug
    suffix=debug
    echo "debug build"
fi

sdk=`xcodebuild -showsdks | grep -o 'iphoneos[0-9\.]\+' | head -n 1`
simsdk=`xcodebuild -showsdks | grep -o 'iphonesimulator[0-9\.]\+' | head -n 1`

homed=`pwd`

xcodebuild -project build/cocos2d_libs.xcodeproj/ -target "libcocos2d iOS" -configuration $mode -sdk $sdk build

if [ "$2" == "nosim" ]; then
    echo "Skip build for simulator"
else
    xcodebuild -project build/cocos2d_libs.xcodeproj/ -target "libcocos2d iOS" -configuration $mode -sdk $simsdk build
fi

mkdir -p bin-ios/lib-$mode
lipo -create build/build/$mode-*/libcocos2d\ iOS.a -output bin-ios/lib-$mode/libcocos2diOS.a

rsync -acv --files-from=ioshd . bin-ios/

say -v alex "cocos2d-x build finish"
