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

echo "Installing Dracula Theme..."
pip3 install JLDracula

echo "Set JLDracula Theme..."
settings_file="themes.jupyterlab-settings"
rm -rf $settings_file
touch $settings_file

cat >$settings_file << EOF
{
    // By Asoo
    // Theme
    // @jupyterlab/apputils-extension:themes
    // Theme manager settings.
    // *************************************

    // Selected Theme
    // Application-level visual styling theme. Ignored when Adaptive Theme is enabled.
    "theme": "JLDracula"
}
EOF

rm -rf ~/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings
mkdir -p ~/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/
mv themes.jupyterlab-settings ~/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/.

echo "JupyterLab installed."
