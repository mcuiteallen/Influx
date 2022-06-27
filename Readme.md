# InfluxDB

## Feature
* **Lightweight** ( low computing power)
* **Cross Platform**
* **Real-Time performance** ( in-memory )
* **Easy to Use** / Operation
* **Visualization**
* **Temporary data recycle 7~14 days**
* **User can "Add/Del/Update/Query" in E2I DB by API**
* **Data base UI - list by time , query rule, export to CSV**
* Edge Computing - Data Preprocess storage
* Recycle - ( - HDD capability )
* Backup / Migrate to other Edge platform (?)
* Easy portable to another platform

## Install
Step 1 : Download the file(.zip) v1.8.0
https://portal.influxdata.com/downloads/
![](https://i.imgur.com/tWf0rBk.png)

Step 2 : Unzip
![](https://i.imgur.com/DJFne1l.png)
* influxd.exe(62.2MB) ->   Server
* influx.exe(50MB) ->    Client
* influxdb.conf(20.9KB) -> Config by Server 

Step 3 : Run server with config
```
influxd -config ./influxdb.conf
```
![](https://i.imgur.com/uKoeWKw.png)
