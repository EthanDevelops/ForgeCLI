#!/bin/bash

if [ `whoami` != root ]; then
    echo Please run this script as root or using sudo
    exit
fi

echo ""
echo "ForgeCLI Installer"
echo "GoLang Version"
echo ""

DESTINATION="/opt/forgecli"
mkdir -p ${DESTINATION}

BUILD_DIR="/usr/share/forgecli"
mkdir -p ${BUILD_DIR}


echo "Checking for dependencies..."

if ! [ -x "$(command -v go)" ]; then
  echo 'Error: golang is not installed' >&2
  while true; do
    read -p "Do you wish to install this program?" yn
        case $yn in
            [Yy]* ) ./installgo.sh; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
  exit 1
fi

if ! [ -x "$(command --version java)" ]; then
  echo 'Error: java is not installed' >&2
  while true; do
    read -p "Do you wish to install this program?" yn
        case $yn in
            [Yy]* ) ./installjava.sh; break;;
            [Nn]* ) echo "Bailing out. You are on your own now."; exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
  exit 1
fi

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed' >&2
  while true; do
    read -p "Do you wish to install this program?" yn
        case $yn in
            [Yy]* ) ./installgit.sh; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
  exit 1
fi

echo "==> Downloading ForgeCLI"



echo ""
echo "Installation complete."
echo ""

# Exit from the script with success (0)
exit 0

__ARCHIVE__