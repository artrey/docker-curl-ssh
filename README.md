# Docker with curl and ssh client

[![Docker Pulls](https://img.shields.io/docker/pulls/artrey/docker-curl-ssh.svg)](https://hub.docker.com/r/artrey/docker-curl-ssh/)
[![GitHub issues](https://img.shields.io/github/issues/artrey/docker-curl-ssh.svg)](https://github.com/artrey/docker-curl-ssh/issues)
[![GitHub stars](https://img.shields.io/github/stars/artrey/docker-curl-ssh.svg?style=social&label=Star)](https://github.com/artrey/docker-curl-ssh)

This docker image installs curl and ssh client (ssh agent) on top of the `docker` image.
This is very useful for CI pipelines, which leverage "Docker in Docker".

## Usage instructions for GitLab CI

You may use it like this in your `.gitlab-ci.yml` file.

```yaml
image: artrey/docker-curl-ssh

services:
  - docker:dind

before_script:
  - docker info
  - curl -V
  - eval "$(ssh-agent -s)"
  - echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add -
  - mkdir -p ~/.ssh
  - chmod 700 ~/.ssh
  - echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

some_action:
  stage: deploy
  script:
    - ssh -o StrictHostKeyChecking=no "$SERVER_USER"@"$SERVER_ADDRESS" '<action on server>'
    - curl <some resource>
```
