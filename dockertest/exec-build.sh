#!/bin/bash
echo "Start checking the docker & docker-compose version"
# Record current versions 
docker -v && docker-compose -v

# Removes all stopped containers, dangling images, and unused networks
#docker system prune --force

#remove all unused volumes
#docker system prune --volumes --force

# Startup container(s)
# docker-compose --file ./dockertest/docker-compose.yml up
chmod +x ./dockertest/run_test.sh

docker-compose --file ./dockertest/docker-compose.yml up --force-recreate --abort-on-container-exit --build application
