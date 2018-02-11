# Spigot dockerfile
FROM openjdk:stretch
WORKDIR /root/mc/

COPY "$PWD"/builder/spigot.jar /root/mc/
COPY "$PWD"/../dynmap/dynmap.jar /root/mc/plugins/
COPY "$PWD"/configs/eula.txt /root/mc/

EXPOSE 25565
ENTRYPOINT [ "java", "-jar", "spigot.jar" ]