#!/bin/bash

# Install test version of docker engine, also shell completions
curl -fsSL https://test.docker.com/ | sh

# Add the vagrant user to the docker group
usermod -aG docker vagrant

# Configure the docker engine
# Daemon options: https://docs.docker.com/engine/reference/commandline/dockerd/
# Set both unix socket and tcp to make it easy to connect both locally and remote
# You can add TLS for added security (docker-machine does this automagically)
cat > /etc/docker/daemon.json <<END
{
    "hosts": [ 
        "unix://",
        "tcp://0.0.0.0:2375"
    ],
    "experimental": true,
    "debug": true,
    "metrics-addr": "0.0.0.0:9323" 
}
END
# We need to reload the config file, however some options don't require reload (and more in the future) 

# You can't pass both CLI args and use the daemon.json for parameters, so I'm using the RPM systemd unit file. 
# This version changes the following as of 17.03:
#  - Removes Requires=docker.socket
#  - Removes docker.socket from After
#  - Sets LimitNOFILE=infinity
#  - Removes -H fd:// from ExecStart 
wget -O /lib/systemd/system/docker.service https://raw.githubusercontent.com/docker/docker/v17.03.0-ce-rc1/contrib/init/systemd/docker.service.rpm
systemctl daemon-reload
systemctl restart docker

# optional tools for learning 
apt-get install -y -q ipvsadm tree
# lsns is helpful from util-linux, this is installed already
