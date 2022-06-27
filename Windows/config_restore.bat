@echo off
SET APPDIR=%1
SET TEMPDIR=%2

@rem restore InfluxDB DB folder from system temp folder

SET INFLUXDB_DB_PATH="%APPDIR:"=%var"
SET TMP_DB_PATH="%TEMPDIR:"=%var"

if exist %TMP_DB_PATH% (
	robocopy %TMP_DB_PATH% %INFLUXDB_DB_PATH% /E
	rmdir %TMP_DB_PATH% /s/q
)

@rem Note: return 0 if action is working well, otherwise installation will fail
exit 0
