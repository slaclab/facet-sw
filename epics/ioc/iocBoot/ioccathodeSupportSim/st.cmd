#!../../bin/linux-x86_64/cathodeSupportSim

## You may have to change cathodeSupportSim to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", "10000000")

## Register all support components
dbLoadDatabase "dbd/cathodeSupportSim.dbd"
cathodeSupportSim_registerRecordDeviceDriver pdbbase

## Hand generated DB records for vacuum systems, watchdog etc
dbLoadRecords "db/simservices_acr.vdb"
dbLoadRecords "db/watchdog.vdb", "user=IN10_CATHODESUPPORT"

## iocAdmin
epicsEnvSet("ENGINEER","Glen White")
epicsEnvSet("LOCATION","FACET IN10 CATHODE")
dbLoadRecords("db/iocAdminSoft.db","IOC=IN10_CATHODESUPPORT")

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=whitegr"

