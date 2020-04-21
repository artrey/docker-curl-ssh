ARG DOCKER_IMAGE=docker
ARG DOCKER_VERSION=stable
FROM ${DOCKER_IMAGE}:${DOCKER_VERSION}

ARG DOCKER_IMAGE
ARG DOCKER_VERSION

RUN apk add --no-cache openssh-client curl

LABEL \
  maintainer="Alexander Ivanov <oz.sasha.ivanov@gmail.com>" \
  description="This docker image installs curl and ssh client (ssh agent) on top of the docker image." \
  licenses="MIT" \
  source="https://github.com/artrey/docker-curl-ssh" \
  title="Docker image with installed curl and ssh client" \
  version="${DOCKER_IMAGE}:${DOCKER_VERSION} with curl and ssh client"
