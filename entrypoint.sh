#!/bin/bash
cd /home/container
# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}".
echo WARNING. WARNING. WARNING.
echo YOU ARE USING A NODEJS VERSION THAT IS NO LONGER SUPPORTED BY NODE.
echo WE WILL BE DEPRECATING NODEJS V12 LATE 2022 FROM CREATABLE HOSTING.
echo PLEASE COMPLETE THE UPGRADES REQUIRED TO YOUR SCRIPT TO SUPPORT NEWER NODEJS VERSION.
echo Starting server..
# Run the Server
eval ${MODIFIED_STARTUP}
echo Started!