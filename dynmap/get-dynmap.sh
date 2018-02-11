#!/bin/bash
# Gets the latest version of dynmap
# I will probably replace this by a build process later

rm -rf download
rf -rf dynmap.jar
echo "Getting Dynmap 2.5 from dev.bukkit.org"
wget https://dev.bukkit.org/projects/dynmap/files/2431572/download
mv -f download dynmap.jar
cp dynmap.jar ../spigot/