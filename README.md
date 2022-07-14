# Pointer Recognition with Jetson Nano
For this project, I will be using the [Jetson Nano](https://nvidia.github.io/jetson-nano/) and a pre-trained ONNX model using [Teachable Machine](https://teachablemachine.withgoogle.com/) to recognize the direction someone is pointing. This is a very simple project, but it is a good example of how to implement a Keras model in a Jetson Nano through the ONNX format.

## Prerequisites
Make sure you have the following:

### Hardware
- NVIDIA Jetson Nano Developer Kit (https://developer.nvidia.com/jetson-nano)
  - I used the 2GB version of the Nano Developer Kit, but theoretically you can use any version of the Nano Developer Kit
- I suggest a microSD card with around 64GB of free space
  - You can get a microSD card from [Amazon](https://www.amazon.sg/SanDisk-Ultra-UHS-I-MicroSDXC-120MB/dp/B08L5FM4JC/) (this is the same microSD card that I used for this project)
- USB to Micro USB data cable
- USB-C power supply
- HDMI cable
- A monitor
- USB keyboard and mouse

### Software
- [Teachable Machine](https://teachablemachine.withgoogle.com/)
- [Jetpack SDK](https://developer.nvidia.com/embedded/jetpack)
- [Warp](https://warp.dev/) (Recommended for MacOS users)

## Installation

### Initializing the Jetpack SDK
1. You need to install the Jetpack SDK for the Jetson Nano. Currently, the latest version is 4.6.1.
   - Download the SDK from [NVIDIA](https://developer.nvidia.com/embedded/jetpack-sdk-461)
   - Flash the SDK onto your Jetson Nano using [balenaEtcher](https://balena.io/etcher/)
     - You can also format your SD card using the [SD Memory Card Formatter](https://www.sdcard.org/downloads/formatter/)

2. Connect the Jetson Nano to your monitor using the HDMI cable, and connect your keyboard and mouse to the Jetson Nano.
   - Connect the power supply to the Jetson Nano
   - Once the developer kit is connected, you will be prompted to register an account
   - When you are finished registering, you can power off the Jetson Nano

## Setting up locally
### Cloning the repository and setting up
**Note: This is the most time consuming part of the project - please follow the steps below carefully as you might need to troubleshoot some parts of the process.**

1. Clone this repository with `git clone https://github.com/cytronicoder/pointer-recognition.git`.
   - You can also use `gh repo clone cytronicoder/pointer-recognition` for GitHub Desktop users
2. Change to the `pointer-recognition` directory.

Learn more about the setup script in [SETUP.md](SETUP.md).

### Converting the model to ONNX format
Now, you need to convert the Keras model to the ONNX format. First, create a folder named `models` in the `pointer-recognition` directory. Then, import your Keras model and save it as `keras_model.h5` in the `models` directory.

After you have imported your Keras model, you can run the following command to convert the model to the ONNX format:

```bash
python3 -m venv ~/tensorflow-metal
source ~/tensorflow-metal/bin/activate
python3 convert_keras_to_onnx.py
```

You should now see an additional file named `onnx_model.onnx` in the `models` directory.

## Running on Jetson Nano
### Cloning the repository and setting up
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

### Running the ONNX model on ImageNet
**This section is currently not working, as the ONNX model has dynamic or shape inputs, but no optimization profile has been defined yet. I might have to use TensorRT to optimize the model and add a profile.**

To run the ONNX model on ImageNet, you need to first import the ONNX model into the newly created `build/aarch64/bin` directory. You can do this by running the following command:

```bash
NET=~/pointer-recognition
```

Then, you can `cd` into the `build/aarch64/bin` directory and run the following command:

```bash
./imagenet.py --model=$NET/models/onnx_model.onnx --input_blob=image_inputs --output_blob=sequential_19 --labels=$NET/models/labels.txt --ouput-codec=h264 /dev/video* rtp://192.168.15.100:1234
```

## Credits
Many thanks to [jetson-inference](https://github.com/dusty-nv/jetson-inference) for the inspiration for this project, and to [@iDTechHub](https://github.com/iDTechHub) for sending me the Jetson Nano Developer Kit and making everything possible for me to implement this project.