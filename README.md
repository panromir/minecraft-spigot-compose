This is an implementation of Minecraft's Spigot Server and a plugin called "DynMap" for Docker Compose.
It uses an nginx instance as a reverse Proxy onto the Dynmap.

Please note that this might eventually require a valid SSL certificate to work without errors in modern Browsers such as Chrome and Firefox.
At that point, I will probably provide a script, that makes script retrieval automatic. (Using certbot)

I will keep this as simple and transparent as possible.

# Prerequisites

## Docker
Please install Docker CE and Docker Compose.
Refer to your Distribution's documentation on how to do that.

### Docker CE
Debian: https://docs.docker.com/install/linux/docker-ce/debian/  
CentOS: https://docs.docker.com/install/linux/docker-ce/centos/  
Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/  
Fedora: https://docs.docker.com/install/linux/docker-ce/fedora/  
Binaries (for all other systems): https://docs.docker.com/install/linux/docker-ce/binaries/  

### Docker compose

All Distributions https://docs.docker.com/compose/install/

## Hardware

Technically, this should run on anything that supports Docker and Docker Compose in a reasonably recent version and has >= 4GB RAM and at least a Dual Core.

# TL;DR 
*Just tell me what I need to paste into my Terminal*

Fine!
Go to you Linux machine, open a ```bash```.

```bash
wget https://github.com/panromir/minecraft-spigot-compose/archive/master.zip && \
unzip master.zip && \
cd minecraft-spigot-compose-master && \
chmod +x doitforme.sh && \
/bin/bash doitforme.sh init && \
/bin/bash doitforme.sh

``` 

And it works.
If it doesn't, please refer to the next section.

# Platform specifics

Some Linux distributions come with security features that you could trip over.
Since I personally use CentOS 7, I can only provide information for that. If you would like to contribute platform specifics for another distribution, let me know.

## CentOS 7
https://www.centos.org/
### Firewalld

It is mandatory to open at the very least 2 ports to be able to use your Dynmap and your Minecraft server.  
Instead of fiddling with ```iptables``` you can use ```firewalld``` to make things easier. CentOS ships with ```firewalld``` by default.

If you're using the default ports (in other words, if you haven't edited your config file) the command is as follows:

*Remember that this adds a permanent firewall rule to open ports on your system. This is a potential security risk. Don't do this if you have no idea what this means.*

```bash
firewall-cmd --zone=public --add-port=25565/tcp --permanent
firewall-cmd --zone=public --add-port=8082/tcp --permanent
```

