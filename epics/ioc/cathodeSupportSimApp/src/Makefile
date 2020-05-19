TOP=../..

include $(TOP)/configure/CONFIG


# Build the IOC application
PROD_IOC = cathodeSupportSim

# cathodeSupportSim.dbd will be created and installed
DBD += cathodeSupportSim.dbd

# cathodeSupportSim.dbd will include these files:
cathodeSupportSim_DBD += base.dbd
cathodeSupportSim_DBD += NDPluginSupport.dbd
cathodeSupportSim_DBD += NDPosPlugin.dbd
cathodeSupportSim_DBD += ADSupport.dbd
cathodeSupportSim_DBD += asyn.dbd
cathodeSupportSim_DBD += busyRecord.dbd
cathodeSupportSim_DBD += busySupport.dbd
cathodeSupportSim_DBD += prosilicaSupport.dbd
cathodeSupportSim_DBD += devSoftMotor.dbd
cathodeSupportSim_DBD += motorSim.dbd
cathodeSupportSim_DBD += motorSimSupport.dbd
cathodeSupportSim_DBD += iocAdmin.dbd
cathodeSupportSim_DBD += simDetectorSupport.dbd
cathodeSupportSim_DBD += calc.dbd
cathodeSupportSim_DBD += sseqRecord.dbd
# cathodeSupportSim_registerRecordDeviceDriver.cpp derives from cathodeSupportSim.dbd
cathodeSupportSim_SRCS += cathodeSupportSim_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
cathodeSupportSim_SRCS_DEFAULT += cathodeSupportSimMain.cpp
cathodeSupportSim_SRCS_vxWorks += -nil-

# Required library support
cathodeSupportSim_LIBS += asyn
cathodeSupportSim_LIBS += ADBase
cathodeSupportSim_LIBS += NDPlugin
cathodeSupportSim_LIBS += busy
cathodeSupportSim_LIBS += prosilica
cathodeSupportSim_LIBS += softMotor
cathodeSupportSim_LIBS += motor
cathodeSupportSim_LIBS += motorSimSupport
cathodeSupportSim_LIBS += devIocStats
cathodeSupportSim_LIBS += simDetector
cathodeSupportSim_LIBS += calc

# Finally link IOC to the EPICS Base libraries
cathodeSupportSim_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES


