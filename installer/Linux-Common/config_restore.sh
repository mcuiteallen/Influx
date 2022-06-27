#!/bin/bash
APPDIR=$(cd $(dirname $0) && pwd)
TMPDIR=/tmp

function restore_config_file ()
{
    APP_CFG_FILE_PATH=${APPDIR}/influxdb.conf
    TMP_CFG_FILE_PATH=${TMPDIR}/influxdb.conf

    if [ -f $TMP_CFG_FILE_PATH ]; then
        echo "restore config ..."
        rm -f --preserve-root $APP_CFG_FILE_PATH || exit 1
        mv -f $TMP_CFG_FILE_PATH $APP_CFG_FILE_PATH || exit 1
    fi
}

function restore_config_folder ()
{
    APP_CFG_FOLDER_PATH=${APPDIR}/var
    TMP_CFG_FOLDER_PATH=${TMPDIR}/var

    if [ -d $TMP_CFG_FOLDER_PATH ]; then
        echo "restore config ..."
        rm -rf --preserve-root $APP_CFG_FOLDER_PATH || exit 1
        cp -rpf $TMP_CFG_FOLDER_PATH $APP_CFG_FOLDER_PATH || exit 1
        rm -rf --preserve-root $TMP_CFG_FOLDER_PATH || exit 1
    fi
}

#restore_config_file
restore_config_folder
