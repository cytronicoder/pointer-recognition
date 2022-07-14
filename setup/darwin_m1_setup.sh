#!/bin/bash

# Download and install dependencies for the Apple M1 chip

### Install Tensorflow
echo "Installing tensorflow-macos and tensorflow-metal..."

# Creating a virtual environment and install pip
python3 -m venv ~/tensorflow-metal
source ~/tensorflow-metal/bin/activate
python -m pip install -U pip

# Download and install conda env
curl https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh -o Miniforge3-MacOSX-arm64.sh
bash Miniforge3-MacOSX-arm64.sh

# Uninstall existing tensorflow-macos and tensorflow-metal
python -m pip uninstall tensorflow-macos
python -m pip uninstall tensorflow-metal

# Install dependencies and upgrade tensorflow-deps to latest version
conda install -c apple tensorflow-deps --force-reinstall

# Install base tensorflow
python -m pip install tensorflow-macos

# Install tensorflow-metal plugin
python -m pip install tensorflow-metal

### Install tf2onnx
echo "Installing tf2onnx..."

python -m pip install tf2onnx

### Install onnx
echo "Installing onnx..."

# Reinstall cmake and protobuf
brew uninstall cmake
brew install cmake

brew uninstall protobuf
brew install protobuf

python -m pip install onnx

# Sucess message
echo "Successfully installed dependencies for the Apple M1 chip."