#!/bin/bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $THIS_DIR/set-env.sh
####################################################################################################

echo Unpacking the Android NDK $NDK_RELEASE
(cd $HOME && unzip -q "$NDK_TAR_PATH")
