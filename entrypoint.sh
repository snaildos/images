#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}".
toilet -f mono9 -F gay 'CreatOS'
echo WARNING. WARNING. WARNING.
echo YOU ARE USING A NODEJS VERSION THAT IS NO LONGER SUPPORTED BY NODE.
echo SECURITY UPDATES WILL NO LONGER BE PROVIDED BY SNAILDOS

echo Starting server..
# Run the Server
eval ${MODIFIED_STARTUP}
echo Started!
