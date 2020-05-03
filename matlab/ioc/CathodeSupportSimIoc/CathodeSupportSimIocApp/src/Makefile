TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# xxxRecord.h will be created from xxxRecord.dbd
#DBDINC += xxxRecord

# Install xxxSupport.dbd into <top>/dbd
#DBD += xxxSupport.dbd

# Build an IOC support library
LIBRARY_IOC += CathodeSupportSimIocSupport

# Compile and add the code to the support library
#CathodeSupportSimIocSupport_SRCS += xxxRecord.c
#CathodeSupportSimIocSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
# This is required for Windows DLL builds.
#CathodeSupportSimIocSupport_SRCS += dbSubExample.c
#CathodeSupportSimIocSupport_SRCS += CathodeSupportSimIocHello.c
#CathodeSupportSimIocSupport_SRCS += initTrace.c

CathodeSupportSimIocSupport_LIBS += $(EPICS_BASE_IOC_LIBS)


# Build the IOC application
PROD_IOC = CathodeSupportSimIoc

# CathodeSupportSimIoc.dbd will be created and installed
DBD += CathodeSupportSimIoc.dbd

# CathodeSupportSimIoc.dbd will include these files:
CathodeSupportSimIoc_DBD += base.dbd
CathodeSupportSimIoc_DBD += xxxSupport.dbd
CathodeSupportSimIoc_DBD += dbSubExample.dbd
CathodeSupportSimIoc_DBD += CathodeSupportSimIocHello.dbd
CathodeSupportSimIoc_DBD += initTrace.dbd

# CathodeSupportSimIoc_registerRecordDeviceDriver.cpp derives from CathodeSupportSimIoc.dbd
CathodeSupportSimIoc_SRCS += CathodeSupportSimIoc_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
CathodeSupportSimIoc_SRCS_DEFAULT += CathodeSupportSimIocMain.cpp
CathodeSupportSimIoc_SRCS_vxWorks += -nil-

# Link in the code from our support library
CathodeSupportSimIoc_LIBS += CathodeSupportSimIocSupport

# Finally link IOC to the EPICS Base libraries
CathodeSupportSimIoc_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

