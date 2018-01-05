#!/bin/bash

if [ "$1" == "ios" ] || [ "$1" == "all" ]; then
    mkdir -p $MY_LIB_PATH/libcocos2dx-ios
    for d in 'cocos' 'external' 'extensions' 'lib-Release' 'lib-Debug' 'lib-min-Release' 'lib-min-Debug'
    do
        if [ -a bin-ios/$d ]; then
            rsync -av --delete bin-ios/$d/ $MY_LIB_PATH/libcocos2dx-ios/$d/
        fi
    done
fi

if [ "$1" == "android" ] || [ "$1" == "all" ]; then
    mkdir -p $MY_LIB_PATH/libcocos2dx-android
    rsync -av --delete bin-android/ $MY_LIB_PATH/libcocos2dx-android
fi

say -v alex "cocos2d-x install finish"
