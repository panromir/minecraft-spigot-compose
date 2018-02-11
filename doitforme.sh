#!/bin/bash
# This script only works on Linux Systems (or Windows with a functioning bash) and does not actually conform with any kind of Docker standard
# I'm just lazy so I use this.
# What this does:
# Gets the Spigot Code and builds it Locally
# Gets the latest version of dynmap
# Builds the Spigot Image locally and doesn't push it to a registry (you'd have to do that manually, or if demand exists, I'll add that)
# Removes the stuff that was used to build spigot



# Get Dynmap
/bin/bash "$PWD"/dynmap/get-dynmap.sh

# Build Spigot .jar file
/bin/bash "$PWD"/spigot/builder/buildspigot.sh

# Build Spigot Docker Image
# docker build -t spigot_local:latest "$PWD"/spigot
# Done in Compose

#Create Map folder for volume
mkdir "$PWD"/map

# Run it.
docker-compose up