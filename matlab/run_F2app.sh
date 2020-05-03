#!/bin/sh
# script for execution of deployed FACET-II applications
# run_F2app.sh <appname>
# Sets up the MATLAB Runtime environment and executes chosen app
#
APPDIR="/home/fphysics/whitegr/F2_apps"
MCRROOT="/home/fphysics/whitegr/mcr/v95"
APPNAME="$1"
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:.:${MCRROOT}/runtime/glnxa64 ;
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MCRROOT}/bin/glnxa64 ;
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MCRROOT}/sys/os/glnxa64;
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MCRROOT}/sys/opengl/lib/glnxa64;
export LD_LIBRARY_PATH;
eval "${APPDIR}/${APPNAME}"
