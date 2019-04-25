ARG GOCD_VERSION=v19.2.0
FROM gocd/gocd-agent-debian-8:${GOCD_VERSION}
MAINTAINER Volodmyr Mykhailyk <volodymyr.mykhailyk@gmail.com>

USER root

# Install requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https ca-certificates curl software-properties-common python && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"

# Install docker environment
ARG DOCKER_VERSION
RUN apt-get update && apt-get install -y --no-install-recommends \
    docker-ce=${DOCKER_VERSION}

# Install docker compose
RUN pip install docker-compose

# Install code climate test reporter
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter && \
    chmod +x ./cc-test-reporter && \
    mv ./cc-test-reporter /usr/local/bin/