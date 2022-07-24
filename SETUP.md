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

## Running on Google Colab
You will need to run `keras_to_onnx.ipynb` on Google Colab, as Colab has TensorFlow installed by default. Log in to Google Colab and create a new notebook. Then, create a `models` folder and import your Keras model into it as a `.h5` file. Then, run the notebook. You should see an ONNX model generated in the `models` folder.