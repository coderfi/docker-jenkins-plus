###################
# Enhances the jenkins official image by installing additional tools:
#
# * docker.io package
#
# see https://github.com/cloudbees/jenkins-ci.org-docker

FROM jenkins:1.596.1
MAINTAINER coderfi@gmail.com

USER root

RUN apt-get update \
 && apt-get install -y docker.io \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -O- https://get.docker.com/ | sh

USER jenkins
