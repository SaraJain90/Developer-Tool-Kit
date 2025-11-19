#!/bin/bash

echo "=========================================="
echo " 
echo "=========================================="

REPO_DIR="$(pwd)"

MLCREATE_SCRIPT="$REPO_DIR/create_ml_project.sh"

if [ ! -f "$MLCREATE_SCRIPT" ]; then
    echo "ERROR: create_ml_project.sh not found in this directory."
    echo "Make sure you run this installer from the Developer-Tool-Kit folder."
    exit 1
fi

echo "Installing mlcreate command..."
sudo cp "$MLCREATE_SCRIPT" /usr/local/bin/mlcreate
sudo chmod +x /usr/local/bin/mlcreate

echo "Setting up template directory..."
sudo mkdir -p /usr/local/share/ml-devkit

if [ -d "$REPO_DIR/templates" ]; then
    echo "Copying template files..."
    sudo cp -r "$REPO_DIR/templates/"* /usr/local/share/ml-devkit/
else
    echo "No templates folder found. Skipping."
fi

echo ""
echo "=========================================="
echo " Installation Complete!"
echo "=========================================="

echo "You can now create ML projects anywhere using:"
echo ""
echo "    mlcreate <project-name>"
echo ""
echo "Example:"
echo "    mlcreate heart-disease"
echo ""
echo "Your Developer-Tool-Kit is ready 🎉"
