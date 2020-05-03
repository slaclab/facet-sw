#!/bin/sh
# script for execution of FACET-II controls simulation tools
# run_F2sim.sh
# Sets up the MATLAB Runtime environment and executes chosen simulation environment
# Requires EPICS IOC(s) to be already running
#
APPDIR="F2sim_linux"
MCRROOT="/usr/local/MATLAB/MCR/v98"
APPNAME="F2sim"
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:.:${MCRROOT}/runtime/glnxa64 ;
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MCRROOT}/bin/glnxa64 ;
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MCRROOT}/sys/os/glnxa64;
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MCRROOT}/sys/opengl/lib/glnxa64;
export LD_LIBRARY_PATH;
eval "${APPDIR}/${APPNAME}"
