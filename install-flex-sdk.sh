#!/bin/sh
#parms:
#sdk_path: local path to unzipped SDK
#sdk_version: SDK version

sdk_path=$1
sdk_version=$2

# if you want to download the SDK version first, use this url sample
# http://fpdownload.adobe.com/pub/flex/sdk/builds/flex4/flex_sdk_4.1.0.15006.zip
echo "---------------------------------"
echo "REMOVING OLD FILES"
echo "---------------------------------"
if [ -e "compiler.pom" ]
then
  rm compiler.pom
fi
if [ -e "flex-framework.pom" ]
then
  rm flex-framework.pom
fi
if [ -e "common-framework.pom" ]
then
  rm common-framework.pom
fi
if [ -e "framework-configs.zip" ]
then
  rm framework-configs.zip
fi
echo "---------------------------------"
echo "INSTALLING COMPILER"
echo "---------------------------------"
$PWD/install-flex-compiler.sh $sdk_path $sdk_version

echo "---------------------------------"
echo "INSTALLING FRAMEWORK"
echo "---------------------------------"
$PWD/install-flex-framework.sh $sdk_path $sdk_version
