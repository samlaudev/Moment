#!/usr/bin/env bash

VERSION_XCCONFIG="Moment/Moment/Configurations/Targets/BaseTarget.xcconfig"
SED_CMD="s/\\(PRODUCT_VERSION_SUFFIX=\\).*/\\1${CI_BUILD_NUMBER}/" # Make sure setting this environment variable before call script.
sed -e ${SED_CMD} -i.bak ${VERSION_XCCONFIG} 
rm -f ${VERSION_XCCONFIG}.bak

