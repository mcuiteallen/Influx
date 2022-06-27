@echo off
SET APPDIR=%1
SET TEMPDIR=%2

@rem backup InfluxDB DB folder to system temp folder

SET INFLUXDB_DB_PATH="%APPDIR:"=%var"
SET TMP_DB_PATH="%TEMPDIR:"=%var"

if exist %INFLUXDB_DB_PATH% (
	if exist %TMP_DB_PATH% (
		rmdir %TMP_DB_PATH% /s/q
	)
	robocopy %INFLUXDB_DB_PATH% %TMP_DB_PATH% /E
)

@rem Note: return 0 if action is working well, otherwise installation will fail
exit 0
