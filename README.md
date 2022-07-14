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


## Setup and execution
To run this project, please refer to the [SETUP.md](SETUP.md) file - this Markdown file contains all the steps to setup and execute the project. Note that this project is a work in progress and is not yet complete, and individual issues have been created for the respective parts that are not yet complete.


## Impact
This is a very simple project, but it is a good example of how to implement a Keras model in a Jetson Nano through the ONNX format and has a lot of potential for future applications. By training a model that can recognize the direction someone is pointing, we can create future applications for handheld devices that can be used to detect the direction someone is pointing and perform actions accordingly. For example:

- If someone is pointing to the left, we can go to the previous page in a web browser and vice versa
- If someone is pointing upwards, we can go to back the home screen of the device
- If someone is pointing downwards, we can go to the notification bar of the device


## Credits
Many thanks to [jetson-inference](https://github.com/dusty-nv/jetson-inference) for the inspiration for this project, and to [@iDTechHub](https://github.com/iDTechHub) for sending me the Jetson Nano Developer Kit and making everything possible for me to implement this project.