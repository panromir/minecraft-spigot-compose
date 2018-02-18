#!/bin/bash
# This script only works on Linux Systems (or Windows with a functioning bash) and does not actually conform with any kind of Docker standard
# I'm just lazy so I use this.
# What this does:
# Gets the Spigot Code and builds it Locally
# Gets the latest version of dynmap
# Builds the Spigot Image locally and doesn't push it to a registry (you'd have to do that manually, or if demand exists, I'll add that)
# Removes the stuff that was used to build spigot

rootfo="$PWD"
if [ "$1" == "init" ]; then
    
    # Make stuff executable
    chmod +x "$PWD"/dynmap/get-dynmap.sh
    chmod +x "$PWD"/spigot/builder/buildspigot.sh

    # Get Dynmap
    cd "$PWD"/dynmap/
    /bin/bash get-dynmap.sh

    # Build Spigot .jar file
    cd "$rootfo"
    cd "$PWD"/spigot/builder/
    /bin/bash buildspigot.sh

    # Build Spigot Docker Image
    # docker build -t spigot_local:latest "$PWD"/spigot
    # Done in Compose

    #Create Map folder for volume
    cd "$rootfo"
    mkdir "$PWD"/map
    mkdir "$PWD"/world
    mkdir "$PWD"/world_nether
    mkdir "$PWD"/world_the_end
    
fi

if [ "$1" == "down" ]; then
    cd "$rootfo"
    docker-compose down
fi

if [ "$1" == "update" ]; then
    cd "$rootfo"

    docker-compose down
    
    # Delete Old binaries
    rm -rf "$PWD"/dynmap/dynmap.jar
    rm -rf "$PWD"/spigot/builder/spigot.jar
    rm -rf "$PWD"/spigot.jar
    rm -rf "$PWD"/spigot/dynmap.jar

     # Get Dynmap
    cd "$PWD"/dynmap/
    /bin/bash get-dynmap.sh

    # Build Spigot .jar file
    cd "$rootfo"
    cd "$PWD"/spigot/builder/
    /bin/bash buildspigot.sh
fi
    
# Run it.

if [ -z "$1" ]; then
    cd "$rootfo"
    docker-compose up -d
fi