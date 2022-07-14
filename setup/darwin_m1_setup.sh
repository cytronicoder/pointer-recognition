#!/bin/bash

# Download and install dependencies for the Apple M1 chip

### Install Tensorflow
echo "Installing tensorflow-macos and tensorflow-metal..."

# Install pip
python -m pip install -U pip

# Download and install conda environment
if [ -f "Miniforge3-MacOSX-arm64.sh" ]; then
    echo "Miniforge3-MacOSX-arm64.sh detected."
    bash Miniforge3-MacOSX-arm64.sh
else
    echo "Miniforge3-MacOSX-arm64.sh not detected. Downloading..."
    curl https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh -o Miniforge3-MacOSX-arm64.sh
    bash Miniforge3-MacOSX-arm64.sh
fi

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
python -m pip install onnx

# Sucess message
echo "Successfully installed dependencies for the Apple M1 chip."