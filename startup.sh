#!/bin/bash

if ! command -v pip &> /dev/null
then
    echo "pip not found, installing..."
    sudo apt-get update
    sudo apt-get install python-pip -y
else
    echo "pip is already installed"
fi

echo ""
echo "installing requirements"
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "Failed to install pip requirements"
    exit $?
fi
export FLASK_APP=app.py
flask run --port=8000

# Remove existing versions of Node.js and npm
# echo ""
# echo "Removing existing versions of Node.js and npm"
# echo ""
# apt-get remove -y nodejs npm

# Install nvm and update Node.js to the latest version
# echo ""
# echo "Installing nvm and updating Node.js"
# echo ""
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
# source /root/.bashrc
# nvm install node
# if [ $? -ne 0 ]; then
#     echo "Failed to update Node.js"
#     exit $?
# fi

# # # Install npm
# # echo ""
# # echo "Installing npm"
# # echo ""
# # apt-get install -y --no-install-recommends npm
# # if [ $? -ne 0 ]; then
# #     echo "Failed to install npm"
# #     exit $?
# # fi

# # Update package list and install npm
# echo ""
# echo "Running apt-get update and upgrade and install npm"
# echo ""
# # apt-get update -y && apt-get upgrade -y && apt-get install -y --no-install-recommends npm
# apt-get update -y && apt-get install -y --no-install-recommends npm
# if [ $? -ne 0 ]; then
#     echo "Failed to upgrade packages and install npm"
#     exit $?
# fi

# echo ""
# echo "---------------- TESTINGCASE ----------------"
# echo "Node.js version: $(node -v)"
# echo "npm version: $(npm -v)"
# echo ""

# # Restore and build frontend using npm
# echo ""
# echo "Restoring and building frontend"
# echo ""
# cd frontend && npm install && npm run build
# if [ $? -ne 0 ]; then
#     echo "Failed to restore and build frontend"
#     exit $?
# fi

exit 0