#!/bin/bash

# Stop all Docker containers
sudo docker kill $(docker ps -q)

# Delete all Docker containers
sudo docker rm $(docker ps -a -q)

# Delete all Docker images
sudo docker rmi $(docker images -q -f dangling=true)
sudo docker rmi $(docker images -q)

# Delete all Docker volumes.
# Runmomg cleanup script twice, to get rid of everything.
sudo ./docker-cleanup-volumes.sh
sudo ./docker-cleanup-volumes.sh

# Stop Docker
sudo systemctl stop docker

# Delete contents of /var/lib/docker
sudo rm -rf /var/lib/docker

# Start Docker
sudo systemctl start docker
