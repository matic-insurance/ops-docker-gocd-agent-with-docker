# ops-docker-gocd-agent-with-docker
Docker image for GoCD agent with Docker outside of docker support

[![Build Status](https://travis-ci.org/matic-insurance/ops-docker-gocd-agent-with-docker.svg?branch=master)](https://travis-ci.org/matic-insurance/ops-docker-gocd-agent-with-docker)

## GoCD

GoCD agent docker file is used as base image 

## Usage

Please referer to the [GoCD repository](https://github.com/gocd/docker-gocd-agent)
for usage instructions

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
