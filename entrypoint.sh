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
echo Checking latest version...
# wget --max-redirect=0 https://cdn.snaildos.com/lavaosupdate -O .lavaosupdate -q 
latestver=`cat .lavaosupdate`

if [ ! -f ".lavaos" ]; then
echo Installing Lavalink $latestver
wget --max-redirect=0 https://cdn.snaildos.com/Lavalink.jar -O Lavalink.jar -q --show-progress
echo Installed $latestver
fi

if [[ $(grep -L $latestver .lavaos) ]]; then
  echo Uninstalling previous versions of Lavalink...
  rm Lavalink.jar -R
  echo Installing Lavalink $latestver
  wget --max-redirect=0 https://cdn.snaildos.com/Lavalink.jar -O Lavalink.jar -q --show-progress
  echo Installed $latestver;
fi

echo Validating Configuration...
if [ ! -f ".lavaos" ]; then
   echo Skipping installing Lavalink package, install LavaOS first...
   echo LavaOS has not been installed yet
   rm application.yml
   wget --max-redirect=0 application.yml https://raw.githubusercontent.com/freyacodes/Lavalink/master/LavalinkServer/application.yml.example -O application.yml -q --show-progress
   echo $latestver > .lavaos
   echo LavaOS has been installed
   echo Rebooting...
   exit
   exit
fi

if [ ! -f "Lavalink.jar" ]; then
echo Lavalink package is missing, re-installing...
echo Installing Lavalink $latestver
wget --max-redirect=0 https://cdn.snaildos.com/Lavalink.jar -O Lavalink.jar -q --show-progress
echo Installed $latestver
fi

echo Intialization sequence complete
toilet -f mono9 'LavaOS'

# Run the Server
eval ${MODIFIED_STARTUP}
echo LavaOS starting!
