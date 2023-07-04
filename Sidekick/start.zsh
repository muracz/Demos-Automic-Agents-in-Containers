#!/bin/zsh
# Build
docker build -t demo_container_sidekick .
# Run
docker run --env-file=env docker.io/library/demo_container_sidekick