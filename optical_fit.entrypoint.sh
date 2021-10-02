#!/bin/bash
set -e
source /opt/geant4/bin/geant4.sh
export WCSIMDIR=/WCSim
export LD_LIBRARY_PATH=$WCSIMDIR/:$LD_LIBRARY_PATH
source /optical_fit/build/Linux/setup.sh

exec "$@"
