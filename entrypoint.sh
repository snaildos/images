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

if [ -f ".lavaos" ]; then
echo Uninstalling previous versions of Lavalink...
rm Lavalink.jar -R
fi

if [ -f ".lavaos" ]; then
echo Installing Lavalink v3.7.6...
wget --max-redirect=0 https://cdn.snaildos.com/Lavalink.jar -O Lavalink.jar -q --show-progress
echo Installed v3.7.6
fi

if [[ $(grep -L "376" .lavaos) ]]; then   
  echo Installing Lavalink v3.7.6...
  wget --max-redirect=0 https://cdn.snaildos.com/Lavalink.jar -O Lavalink.jar -q --show-progress
  echo Installed v3.7.6; 
fi

echo Validating Configuration...
if [ ! -f ".lavaos" ]; then
   echo Skipping installing Lavalink package, install LavaOS first...
   echo LavaOS has not been installed yet
   rm application.yml
   wget --max-redirect=0 application.yml https://raw.githubusercontent.com/freyacodes/Lavalink/master/LavalinkServer/application.yml.example -O application.yml -q --show-progress
   echo 376 > .lavaos
   echo LavaOS has been installed
   echo Rebooting...
   exit
   exit
fi

echo Intialization sequence complete
toilet -f mono9 'LavaOS'

# Run the Server
eval ${MODIFIED_STARTUP}
echo LavaOS starting!
