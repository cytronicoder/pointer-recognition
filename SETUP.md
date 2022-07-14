# Setting up the project

## Notice
**I have so far only tested the setup script on a macOS device with an M1 chip**, and I have not tested it on a macOS device with an Intel chip nor a Linux device. If you have any questions, please submit an issue on [GitHub](https://github.com/cytronicoder/pointer-recognition). Additionally, you can contribute to the project by submitting a pull request with additional setup scripts for other operating systems.

## Downloading the conda environment
Before you run the setup script, you need to download [Miniforge](https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh) and save it to your Downloads folder.

```bash
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
```
    
Then, `cd` into the project directory and run the following commands:
    
```bash
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