#!/bin/bash
# Builds Spigot
mkdir "$PWD"/BuildTools
cd "$PWD"/BuildTools
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
docker run -ti -d --name tmp-buildtools -v "$PWD":/root/bt:z -v "$PWD"/spigot:/root/bt/spigot.jar:z openjdk:stretch
docker exec -w /root/bt tmp-buildtools java -jar BuildTools.jar && chmod +x BuildTools.jar && mv -f spigot-*.jar spigot/spigot.jar
docker stop tmp-buildtools 
docker rm tmp-buildtools 
cd "$PWD"/..
cp -f "$PWD"/BuildTools/spigot/spigot.jar "$PWD"/
rm -rf "$PWD"/BuildTools/