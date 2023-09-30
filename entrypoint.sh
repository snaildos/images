#!/bin/ash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"
toilet -f mono9 -F gay 'CreatOS'
echo Initializing LavOS powered by CreatOS

echo Uninstalling previous versions of Lavalink...
rm Lavalink.jar -R
echo Installing Lavalink v3.7.6...
wget --max-redirect=0 https://cdn.snaildos.com/Lavalink.jar -q --show-progress
echo Installed v3.7.6
echo Validating Configuration...
if [ ! -f "application.yml" ]; then
   wget --max-redirect=0 application.yml https://raw.githubusercontent.com/freyacodes/Lavalink/master/LavalinkServer/application.yml.example -o application.yml -q --show-progress
   echo Installed default config
fi
echo Intialization sequence complete
toilet -f mono9 'LavaOS'
# Run the Server
eval ${MODIFIED_STARTUP}
echo LavaOS starting!
