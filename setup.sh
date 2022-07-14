#!/bin/bash

# check operating system
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

echo "Detected operating system: ${machine}"

# operating system specific setup
if [ "$machine" == "Mac" ]; then
    # keep asking for user input until they enter a valid choice
    while true; do
        read -p "Are you currently using a M1 chip? [y/n] " yn
        case $yn in
            [Yy]* )
                echo "Installing dependencies for the Apple M1 chip..."
                source setup/darwin_m1_setup.sh
                break
                ;;
            [Nn]* )
                echo "Sorry, this script is only for devices with a M1 chip."
                exit
                ;;
            * ) echo "Please answer yes or no.";;
        esac
    done 
else
    echo "Sorry, this script is currently only for macOS systems with a Apple M1 chip."
    exit
fi