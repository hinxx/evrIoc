< envPaths
errlogInit(20000)

## Register all support components
dbLoadDatabase("$(TOP)/dbd/mrf.dbd")
mrf_registerRecordDeviceDriver(pdbbase)


# Timing MTCA EVR 300
epicsEnvSet("SYS"               "EVR")
epicsEnvSet("DEVICE"            "MTCA")
epicsEnvSet("EVR_PCIDOMAIN"     "0x0")
epicsEnvSet("EVR_PCIBUS"        "0x6")
epicsEnvSet("EVR_PCIDEVICE"     "0x0")
epicsEnvSet("EVR_PCIFUNCTION"   "0x0")

mrmEvrSetupPCI($(DEVICE), $(EVR_PCIDOMAIN), $(EVR_PCIBUS), $(EVR_PCIDEVICE), $(EVR_PCIFUNCTION))
dbLoadRecords("$(MRFIOC2)/db/evr-mtca-300.db", "DEVICE=$(DEVICE), SYS=$(SYS), Link-Clk-SP=88.0525")

dbLoadRecords("$(MRFIOC2)/db/evr-softEvent.template", "DEVICE=$(DEVICE), SYS=$(SYS), EVT=14, CODE=14")
dbLoadRecords("$(MRFIOC2)/db/evr-pulserMap.template", "DEVICE=$(DEVICE), SYS=$(SYS), PID=0, F=Trig, ID=0, EVT=14")

# Auto save/restore
#save_restoreDebug(2)
#dbLoadRecords("../../db/save_restoreStatus.db", "P=DIAG_MTCA:EVR1-AS:")
#save_restoreSet_status_prefix("DIAG_MTCA:EVR1-AS:")

#set_savefile_path("${AUTOSAVE}")
#set_requestfile_path("${AUTOSAVE}")

#set_pass0_restoreFile("mrf_settings.sav")
#set_pass0_restoreFile("mrf_values.sav")
#set_pass1_restoreFile("mrf_values.sav")
#set_pass1_restoreFile("mrf_waveforms.sav")

# disable use of current time until validation is implemented
#var(mrmGTIFEnable, 0)

iocInit()

#makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_settings.req", "autosaveFields_pass0")
#makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_values.req", "autosaveFields")
#makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_waveforms.req", "autosaveFields_pass1")

#create_monitor_set("mrf_settings.req", 5 , "")
#create_monitor_set("mrf_values.req", 5 , "")
#create_monitor_set("mrf_waveforms.req", 30 , "")
