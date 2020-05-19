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
dbLoadRecords "db/simservices.vdb"
dbLoadRecords "db/watchdog.vdb", "user=IN10_CATHODESUPPORT"

## iocAdmin
epicsEnvSet("ENGINEER","Glen White")
epicsEnvSet("LOCATION","FACET IN10 CATHODE")
dbLoadRecords("db/iocAdminSoft.db","IOC=IN10_CATHODESUPPORT")

## Camera records
cd "db"
#prosilicaConfig("P1", 1234567, 50, 0)
#asynSetTraceIOMask("P1",0,2)
#dbLoadRecords("prosilica.template","P=CAMR:LT10:,R=900:,PORT=P1,ADDR=0,TIMEOUT=1")

simDetectorConfig("P1",1024,1024,1,0,0)
dbLoadRecords("simDetector.template","P=CAMR:LT10:,R=900:,PORT=P1,ADDR=0,TIMEOUT=1")

NDStdArraysConfigure("Image", 5, 0, "P1", 0, 0)
dbLoadRecords("NDStdArrays.template", "P=CAMR:LT10:900:,R=Image:,PORT=Image,ADDR=0,TIMEOUT=1,NDARRAY_PORT=P1,TYPE=Int8,FTVL=SHORT,NELEMENTS=4177920")
NDROIConfigure("ROI", 5, 0, "P1", 0, 0, 0, 0, 0, 5)
dbLoadRecords("NDROI.template","P=CAMR:LT10:900:,R=ROI:,PORT=ROI,ADDR=0,TIMEOUT=1,NDARRAY_PORT=P1")
NDROIStatConfigure("Stats", 5, 0, "P1", 0, 1, 0, 0, 0, 0, 5)
dbLoadRecords("NDROIStat.template","P=CAMR:LT10:900:ROI:,R=Stats:,PORT=Stats,ADDR=0,TIMEOUT=1,NDARRAY_PORT=P1,NCHANS=1")
NDStatsConfigure("STATS1", 5, 0, "P1", 0, 0, 0, 0, 0, 5)
dbLoadRecords("NDStats.template","P=CAMR:LT10:900:,R=Stats:,  PORT=STATS1,ADDR=0,TIMEOUT=1,HIST_SIZE=256,XSIZE=1024,YSIZE=1024,NCHANS=5,NDARRAY_PORT=P1")
dbLoadRecords("profile.template","P=CAMR:LT10:, ID=900, XSIZE=656, X_OFF=0, YSIZE=492, Y_OFF=0, RESOLUTION=0.0099, PREC=4, EGU=mm")

## Motor records
dbLoadTemplate("motor.substitutions")
# Create simulated motors: ( start card , start axis , low limit, high limit, home posn, # cards, # axes to setup)
motorSimCreate( 0, 0, 0, 320000, 0, 1, 2 )
# Setup the Asyn layer (portname, low-level driver drvet name, card, number of axes on card)
drvAsynMotorConfigure("motorSim1", "motorSim", 0, 2)
#motorSimCreateController("motorSim1", 8)
# motorSimConfigAxis(port, axis, lowLimit, highLimit, home, start)
motorSimConfigAxis("motorSim1", 0, 0, 10,  0, 0)
motorSimConfigAxis("motorSim1", 1, 0, 10, 0, 0)

cd ".."

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=whitegr"

