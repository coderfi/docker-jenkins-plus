#!/usr/bin/env sh

# if DOCKER_GID is present, then change
# the docker group id to match
if [ "${DOCKER_GID}" != "" ]; then
    groupmod -g ${DOCKER_GID} docker
fi

exec sudo -u jenkins /usr/local/bin/jenkins.sh "${@}"
