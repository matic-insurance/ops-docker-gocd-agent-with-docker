# ops-docker-gocd-agent-with-docker
Docker image for GoCD agent with Docker outside of docker support

Builds running on the agent will have access to the docker commands

[![Build Status](https://travis-ci.org/matic-insurance/ops-docker-gocd-agent-with-docker.svg?branch=master)](https://travis-ci.org/matic-insurance/ops-docker-gocd-agent-with-docker)

## GoCD

GoCD agent docker file is used as base image 

## GoCD Usage

Please referer to the [GoCD repository](https://github.com/gocd/docker-gocd-agent)
for GOCD usage instructions

## Docker Usage

Docker is installed inside of GoCD agent image but 
containers and commands are run outside of it. 
Docker that is running agent image or any other docker 
daemon you have access to from inside of agent

**Configuration**:

- Configure Docker daemon that will execute commands to listen 
Docker Engine API requests via tcp `-H tcp://0.0.0.0:2375`.
[Docker socket options](https://docs.docker.com/engine/reference/commandline/dockerd/#examples)
- Specify `DOCKER_HOST` with address of your docker daemon `tcp://DOCKER_HOST_UP:2375`

**Important** Exposing docker api over tcp is not secure. 
Make sure you know what uou are doing and no one can access API port.   

## Installed packages
- `docker-ce`
- `docker-compose`
- `python`
- `pip`

## Docker Hub

Docker images hosted on [Docker Hub](https://hub.docker.com/r/maticinsurance/gocd-agent-with-docker/)

## Build process

Travis is used to build docker files. Master branch build pushing 
docker files to Docker Hub. Pull request verifies that docker files 
can be built 

## Current built versions

- **Debian**: 8
  - **GOCD**: v17.4.0 
    - **DOCKER**: 17.09.0
  - **GOCD**: v17.11.0 
    - **DOCKER**: 17.09.0
    
## Contribution and support

Feel free to submit pull requests or request new versions used in 
your environment via issues
