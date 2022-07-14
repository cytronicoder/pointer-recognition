#!/bin/bash

# Setting up the environment for the Jetson Nano

# Update the system
echo "Updating the system..."
apt-get update

# Download git and cmake
echo "Installing git and cmake..."
apt-get install git cmake

# Clone the jetson-inference project
echo "Cloning the jetson-inference project..."
if [ -d "jetson-inference" ]; then
    echo "jetson-inference directory detected."
    cd jetson-inference
else
    git clone --recursive https://github.com/dusty-nv/jetson-inference
    cd jetson-inference
    git submodule update --init
fi

# Install libpython3-dev and python3-numpy
echo "Installing libpython3-dev and python3-numpy..."
apt-get install libpython3-dev python3-numpy