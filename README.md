# docker-jenkins-plus

Adds additional tools to the official jenkins docker.

* [docker.io](https://docs.docker.com/installation/debian/)

# quick start

Create a Volume Docker

    docker run --name jenkins-data -v /var/jenkins_home busybox sh -c "mkdir -p /var/jenkins_home; chown 1000:1000 /var/jenkins_home"

Start Jenkins

    docker run -d --name jenkins -p 50000:50000 -p 8282:8080 -v /var/run/docker.sock:/var/run/docker.sock --volumes-from jenkins-data coderfi/jenkins-plus

# see also

* [Official Jenkins Docker](https://registry.hub.docker.com/_/jenkins/)

* [Official Jenkins Docker Github](https://github.com/cloudbees/jenkins-ci.org-docker)
