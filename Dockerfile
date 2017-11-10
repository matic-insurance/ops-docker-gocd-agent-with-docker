FROM gocd/gocd-agent-debian-8:GOCD_VERSION
MAINTAINER Volodmyr Mykhailyk <volodymyr.mykhailyk@gmail.com>

ARG DOCKER_VERSION

USER root

# Install docker environment
RUN apt-get update && apt-get install -y --no-install-recommends \
    docker-ce=${DOCKER_VERSION} docker-engine python-dev libevent-dev python-pip && \
    pip install docker-compose && \
    rm -rf /var/lib/apt/lists/*