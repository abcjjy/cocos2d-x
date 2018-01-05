#!/bin/bash

cd ..
find cocos -name *.inl > ioshd
find cocos -name *.h >> ioshd
find extensions -name *.h >> ioshd
find external -name *.h >> ioshd

sed -i '' '/android/d' ./ioshd
sed -i '' '/winrt/d' ./ioshd
sed -i '' '/mac/d' ./ioshd
sed -i '' '/win10/d' ./ioshd
sed -i '' '/win32/d' ./ioshd
sed -i '' '/winrt/d' ./ioshd
sed -i '' '/win8.1/d' ./ioshd
sed -i '' '/tizen/d' ./ioshd
sed -i '' '/linux/d' ./ioshd
