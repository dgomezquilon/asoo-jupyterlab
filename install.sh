#!/bin/bash

if ! command -v pip3 &> /dev/null
then
    echo "Installing pip3..."
    apt update
    apt install -y python3-pip
else
    echo "pip3 is installed"
fi

echo "Installing JupyterLab..."
pip3 install jupyterlab

echo "JupyterLab installed."
