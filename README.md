# docker-jenkins-plus

Adds additional tools to the official jenkins docker.

* [docker.io](https://docs.docker.com/installation/debian/)

# quick start

Create a Volume Docker

    docker run --name jenkins-data -v /var/jenkins_home busybox sh -c "mkdir -p /var/jenkins_home; chown 1000:1000 /var/jenkins_home"

Start Jenkins with docker support:

    docker run -d --name jenkins -p 50000:50000 -e DOCKER_GID=`grep "^docker" /etc/group|cut -d: -f3` -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --volumes-from jenkins-data coderfi/jenkins-plus

The container will set the container's docker group id to the `DOCKER_GID` env. Be sure this matches the host's docker group id, otherwise
the jenkins process will not have permission to run docker commands!

# browser

visit http://your_host:8080

# recommended Jenkins plugins

* [Docker build step plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+build+step+plugin)

* [Docker build publish Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+build+publish+Plugin)

# see also

* [Official Jenkins Docker](https://registry.hub.docker.com/_/jenkins/)

* [Official Jenkins Docker Github](https://github.com/cloudbees/jenkins-ci.org-docker)

# about the build

I wanted to build docker images via Jenkins on a CoreOS host OS.

I quickly found the official Jenkins docker to accomplish this, however, I also quickly found out
that the `docker` package was lacking from this image.

In order to run docker commands, we mount the host's `/var/run/docker.sock` volume.

To run a docker command, the user must either be `root`, or be part of the `docker` group.

The official Jenkins docker sets the default User to be `jenkins`.

As you can see from the `Dockerfile`, we add the `jenkins` user to the `docker` group.

Unfortunately, the docker's `docker` group is not the same as the host's `docker` group.

So, what we do is hack the docker's `docker` group id to match the host's `docker` group, by means of
allow the `DOCKER_GID` environment variable.

Problem solved! Now I can deploy a Jenkins master inside a docker container on my CoreOS installation,
and use Jenkins as part of my Continuous Integration strategy building other dockers. :)


