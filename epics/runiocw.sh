#!/bin/bash
ssh facet-srv02 "cd ~/whitegr/facet-sw/epics/ioc/iocBoot/ioccathodeSupportSim; screen -L -dmS iocCathodeSupport ../../bin/linux-x86_64/cathodeSupportSim st.cmd"

