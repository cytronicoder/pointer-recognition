#!/bin/bash

# Setting up the environment for the Jetson Nano

# Update
apt-get update

# Download git and cmake
echo "Installing git and cmake..."
apt-get install git cmake

# Clone the jetson-inference project
echo "Cloning the jetson-inference project..."
git clone --recursive https://github.com/dusty-nv/jetson-inference
cd jetson-inference

# Run docker/run.sh
echo "Running docker/run.sh..."
docker/run.sh