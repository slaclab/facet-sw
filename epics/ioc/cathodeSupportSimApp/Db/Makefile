TOP=../..
include $(TOP)/configure/CONFIG

# Install databases, templates & substitutions like this
DB += watchdog.vdb
DB += simservices.vdb
DB += simservices_acr.vdb
DB += profile.template
DB += motor.substitutions
DB_INSTALLS += $(ADSIM)/db/simDetector.template
DB_INSTALLS += $(ADCORE)/db/NDROIStat.template
DB_INSTALLS += $(ASYN)/db/asynRecord.db
DB_INSTALLS += $(ADCORE)/db/ADBase.template
DB_INSTALLS += $(ADCORE)/db/NDArrayBase.template
DB_INSTALLS += $(ADCORE)/db/NDOverlay.template
DB_INSTALLS += $(ADCORE)/db/NDOverlayN.template
DB_INSTALLS += $(ADCORE)/db/NDPluginBase.template
DB_INSTALLS += $(ADCORE)/db/NDProcess.template
DB_INSTALLS += $(ADCORE)/db/NDROI.template
DB_INSTALLS += $(ADCORE)/db/NDStats.template
DB_INSTALLS += $(ADCORE)/db/NDStdArrays.template
DB_INSTALLS += $(ADPRO)/db/prosilica.template
DB_INSTALLS += $(MOTOR)/db/basic_asyn_motor.db
DB_INSTALLS += $(IOCADMIN)/db/iocAdminSoft.db

include $(TOP)/configure/RULES


