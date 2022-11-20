#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


echo "making temp dir $(pwd)/temp"
STARTDIR=($(pwd)/temp)
mkdir -p $(pwd)/temp

cd $(pwd)/temp
echo "installing packages that are needed"
sudo apt install -y git curl cmake gcc-arm-linux-gnueabihf sudo
sudo dpkg --add-architecture armhf && apt-get update
sudo apt-get install libc6:armhf -y
echo "cloning box86"
git clone https://github.com/ptitSeb/box86
cd box86
mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
echo "compiling box86"
make -j$(nproc)
echo "installing box86"
sudo make install
echo "restarting binfmt"
sudo systemctl restart systemd-binfmt
box86 --version
cd ${STARTDIR}
rm -rf box86/
echo "cloning box86"
git clone https://github.com/ptitSeb/box64
cd box64
mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
echo "compiling box64"
make -j$(nproc)
echo "installing box64"
sudo make install
echo "restarting binfmt"
sudo systemctl restart systemd-binfmt
box64 --version
cd ${STARTDIR}
rm -rf box64/
echo "install done"

