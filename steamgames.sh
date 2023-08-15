#!/bin/bash

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root"
  exit 1
fi

# Set up a temporary directory
TEMP_DIR="$(pwd)/temp"
echo "Creating temporary directory: $TEMP_DIR"
mkdir -p "$TEMP_DIR" || { echo "Failed to create temporary directory"; exit 1; }

# Change to the temporary directory
cd "$TEMP_DIR" || { echo "Failed to change to temporary directory"; exit 1; }

# Determine the number of jobs for make
if ! NUM_JOBS=$(nproc); then
  NUM_JOBS=2
fi

# Install required packages
echo "Installing required packages"
dpkg --add-architecture armhf
apt update
apt install -y git curl cmake gcc-arm-linux-gnueabihf sudo libc6:armhf cmake|| { echo "Failed to install packages"; exit 1; }

# Clone and build box86
echo "Cloning and building box86"
git clone https://github.com/ptitSeb/box86 || { echo "Failed to clone box86 repository"; exit 1; }
cd box86 || { echo "Failed to change to box86 directory"; exit 1; }
mkdir build && cd build || { echo "Failed to create build directory"; exit 1; }
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
echo "Compiling box86"
make -j"$NUM_JOBS" || { echo "Failed to compile box86"; exit 1; }
echo "Installing box86"
sudo make install || { echo "Failed to install box86"; exit 1; }
sudo systemctl restart systemd-binfmt

# Display box86 version
box86 --version

# Clean up box86 build
cd "$TEMP_DIR"
rm -rf box86

# Clone and build box64
echo "Cloning and building box64"
git clone https://github.com/ptitSeb/box64 || { echo "Failed to clone box64 repository"; exit 1; }
cd box64 || { echo "Failed to change to box64 directory"; exit 1; }
mkdir build && cd build || { echo "Failed to create build directory"; exit 1; }
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
echo "Compiling box64"
make -j"$NUM_JOBS" || { echo "Failed to compile box64"; exit 1; }
echo "Installing box64"
sudo make install || { echo "Failed to install box64"; exit 1; }
sudo systemctl restart systemd-binfmt

# Display box64 version
box64 --version

# Clean up box64 build
cd "$TEMP_DIR"
rm -rf box64

# Clean up temporary directory
cd ..
rm -rf "$TEMP_DIR"

echo "Installation completed successfully"
