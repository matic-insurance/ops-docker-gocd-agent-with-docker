FROM gocd/gocd-agent-debian-8:GOCD_VERSION
MAINTAINER Volodmyr Mykhailyk <volodymyr.mykhailyk@gmail.com>

ARG DOCKER_VERSION

USER root

# Install docker requirements
RUN apt-get install -y --no-install-recommends \
    apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://apt.dockerproject.org/gpg | apt-key add - && \
    add-apt-repository "deb https://apt.dockerproject.org/repo/debian-$(lsb_release -cs) main"\

# Install docker environment
RUN apt-get update && apt-get install -y --no-install-recommends \
    docker-ce=${DOCKER_VERSION} docker-engine python-dev libevent-dev python-pip && \
    pip install docker-compose