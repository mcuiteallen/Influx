#!/bin/bash

BUILD_SCRIPT_PATH=$(cd "$(dirname "$1")"; pwd)
ARCHIVES_PATH=${BUILD_SCRIPT_PATH}/archives

# ====================================================
# Step1 - Build code
# ====================================================

cd $BUILD_SCRIPT_PATH

# ToDo
# - return error code 1 when fail to build code

# ====================================================
# Step2 - Prepare files for pack
# ====================================================

cd ${BUILD_SCRIPT_PATH} || exit 1

rm -rf ${ARCHIVES_PATH} || exit 1
mkdir -p ${ARCHIVES_PATH} || exit 1

cd ${BUILD_SCRIPT_PATH} || exit 1
cp -f ../Linux-Common/config_backup.sh ${ARCHIVES_PATH} || exit 1
cp -f ../Linux-Common/config_restore.sh ${ARCHIVES_PATH} || exit 1

cp -rf ../../Ubuntu_20.04-x64/* ${ARCHIVES_PATH} || exit 1

# ====================================================
# Step3 - Prepare advsc and advsc config for pack
# ====================================================

cd ${BUILD_SCRIPT_PATH} || exit 1

cp -f ../advsc.ini ${ARCHIVES_PATH} || exit 1

curl -k --fail --output ${ARCHIVES_PATH}/advsc https://dev.azure.com/adv-iedge/EdgeSense-Open/_apis/git/repositories/advsc-binary/items?path=/Ubuntu_20.04-x64/latest/advsc || exit 1
chmod +x ${ARCHIVES_PATH}/advsc || exit 1

echo done
