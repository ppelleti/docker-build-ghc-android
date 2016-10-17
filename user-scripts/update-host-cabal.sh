#!/bin/bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $THIS_DIR/set-env.sh
####################################################################################################

cabal update
cabal install --force-reinstalls \
  Cabal-1.24.0.0 \
  cabal-install-1.24.0.0
