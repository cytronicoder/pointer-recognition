#!/bin/bash

# Setting up the environment for the Jetson Nano

# Update
apt-get update

# Download git and cmake
echo "Installing git and cmake..."
apt-get install git cmake

# Clone the jetson-inference project
echo "Cloning the jetson-inference project..."
if [ -d "jetson-inference" ]; then
    echo "jetson-inference directory detected. Skipping cloning..."
else
    git clone --recursive https://github.com/dusty-nv/jetson-inference

# Run docker/run.sh
echo "Running docker/run.sh..."
cd jetson-inference
docker/run.sh