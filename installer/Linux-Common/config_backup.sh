#!/bin/bash
APPDIR=$(cd $(dirname $0) && pwd)
TMPDIR=/tmp

function backup_config_file ()
{
    APP_CFG_FILE_PATH=${APPDIR}/influxdb.conf
    TMP_CFG_FILE_PATH=${TMPDIR}/influxdb.conf

    if [ -f $APP_CFG_FILE_PATH ]; then
        if [ -f $TMP_CFG_FILE_PATH ]; then
            rm -f --preserve-root $TMP_CFG_FILE_PATH || exit 1
        fi
        echo "backup config ..."
        cp -f $APP_CFG_FILE_PATH $TMP_CFG_FILE_PATH || exit 1
    fi
}

function backup_config_folder ()
{
    APP_CFG_FOLDER_PATH=${APPDIR}/var
    TMP_CFG_FOLDER_PATH=${TMPDIR}/var

    if [ -d $APP_CFG_FOLDER_PATH ]; then
        if [ -d $TMP_CFG_FOLDER_PATH ]; then
            rm -rf --preserve-root $TMP_CFG_FOLDER_PATH || exit 1
        fi
        echo "backup config ..."
        cp -rpf $APP_CFG_FOLDER_PATH $TMP_CFG_FOLDER_PATH || exit 1
    fi
}

#backup_config_file
backup_config_folder
