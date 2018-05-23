FROM gocd/gocd-agent-debian-8:GOCD_VERSION
MAINTAINER Volodmyr Mykhailyk <volodymyr.mykhailyk@gmail.com>

ARG DOCKER_VERSION

USER root

# Install docker requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"

# Install docker environment
RUN apt-get update && apt-get install -y --no-install-recommends \
    docker-ce=${DOCKER_VERSION} python-dev libevent-dev python-pip && \
    pip install docker-compose

# Install code climate test reporter
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter && \
    chmod +x ./cc-test-reporter