# Spigot dockerfile
FROM openjdk:stretch
WORKDIR /root/mc/

COPY builder/spigot.jar /root/mc/
COPY dynmap/dynmap.jar /root/mc/plugins/
COPY configs/eula.txt /root/mc/

EXPOSE 25565
ENTRYPOINT [ "java", "-jar", "spigot.jar" ]