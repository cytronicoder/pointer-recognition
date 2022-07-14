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
    echo "jetson-inference directory detected. Updating..."
    cd jetson-inference
    git pull
    cd ..
else
    git clone --recursive https://github.com/dusty-nv/jetson-inference
fi

# cd into the jetson-inference directory
echo "Running docker/run.sh..."
cd jetson-inference