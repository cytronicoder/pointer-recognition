# Installation
## Initializing the Jetpack SDK
1. You need to install the Jetpack SDK for the Jetson Nano. Currently, the latest version is 4.6.1.
   - Download the SDK from [NVIDIA](https://developer.nvidia.com/embedded/jetpack-sdk-461)
   - Flash the SDK onto your Jetson Nano using [balenaEtcher](https://balena.io/etcher/)
     - You can also format your SD card using the [SD Memory Card Formatter](https://www.sdcard.org/downloads/formatter/)

2. Connect the Jetson Nano to your monitor using the HDMI cable, and connect your keyboard and mouse to the Jetson Nano.
   - Connect the power supply to the Jetson Nano
   - Once the developer kit is connected, you will be prompted to register an account
   - When you are finished registering, you can power off the Jetson Nano

# Setting up locally
## Cloning the repository and setting up
**Note: This is the most time consuming part of the project - please follow the steps below carefully as you might need to troubleshoot some parts of the process.**

1. Clone this repository with `git clone https://github.com/cytronicoder/pointer-recognition.git`.
   - You can also use `gh repo clone cytronicoder/pointer-recognition` for GitHub Desktop users
2. Change to the `pointer-recognition` directory.

**Notice: I have so far only tested the setup script on a macOS device with an M1 chip**, and I have not tested it on a macOS device with an Intel chip nor a Linux device. If you have any questions, please submit an issue on [GitHub](https://github.com/cytronicoder/pointer-recognition). Additionally, you can contribute to the project by submitting a pull request with additional setup scripts for other operating systems.

## Downloading the conda environment
Before you run the setup script, you need to download [Miniforge](https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh) and save it to your Downloads folder.

```bash
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
```
    
Then, `cd` into the project directory and run the following commands:
    
```bash
python3 -m venv ~/tensorflow-metal
source ~/tensorflow-metal/bin/activate

chmod +x setup.sh
./setup.sh
```

Once the setup script is finished, you should see a message like the following:
    
```
Successfully installed dependencies for the Apple M1 chip.
```

To check if the setup was successful, you can run the following command:
    
```bash
pip list
```

If you see that `tensorflow-macos`, `tf2onnx`, and `onnx` are installed, then the setup was successful. You can now refer back to the [README.md](README.md) for more information.

## Converting the model to ONNX format
Now, you need to convert the Keras model to the ONNX format. First, create a folder named `models` in the `pointer-recognition` directory. Then, import your Keras model and save it as `keras_model.h5` in the `models` directory.

After you have imported your Keras model, you can run the following command to convert the model to the ONNX format:

```bash
python3 -m venv ~/tensorflow-metal
source ~/tensorflow-metal/bin/activate
python3 convert_keras_to_onnx.py
```

You should now see an additional file named `onnx_model.onnx` in the `models` directory.

# Running on Jetson Nano
## Cloning the repository and setting up
You can clone this repository with `git clone https://github.com/cytronicoder/pointer-recognition.git` onto your Jetson Nano. Once you have cloned the repository, execute the following command:

```bash
chmod +x ./pointer-recognition/setup/nano.sh
sudo ./pointer-recognition/setup/nano.sh
```

After the setup for the Jetson Nano is finished, you can run the following commands (you may need sudo access):

```bash
cd jetson-inference
mkdir build && cd build
cmake ../
```

Once the process is finished, you can run the following commands

```bash
make
sudo make install
sudo ldconfig
```

## Running the ONNX model on ImageNet
**This section is currently not working, as the ONNX model has dynamic or shape inputs, but no optimization profile has been defined yet. I might have to use TensorRT to optimize the model and add a profile.**

To run the ONNX model on ImageNet, you need to first import the ONNX model into the newly created `build/aarch64/bin` directory. You can do this by running the following command:

```bash
NET=~/pointer-recognition
```

Then, you can `cd` into the `build/aarch64/bin` directory and run the following command:

```bash
./imagenet.py --model=$NET/models/onnx_model.onnx --input_blob=image_inputs --output_blob=sequential_19 --labels=$NET/models/labels.txt --ouput-codec=h264 /dev/video* rtp://192.168.15.100:1234
```
