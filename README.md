WARNING: WORK IN PROGESS: May not work.
=======================================

Kickstart your next Django Project.
===================================
A sensible boilerplate for a Django project. Less time setting up, more time developing.

Quick Start.
============
Install Docker and then
```
git clone https://github.com/cameronmaske/django-fig.git your-apps-name;
cd your-apps-name
pip install -r requirements-dev.txt
fig up
```

Installation.
===============
Let's dive into a more detailed installation of the tools required by this development environment.

To quickly boot up, the key tools are [Docker](http://docker.io) and [fig](https://github.com/orchardup/fig).

Installing Docker.
------------------
Docker's installation various by platform. Native installation is currently only available on Linux platforms, but OSX has some great alternatives.

### Linux
Docker has the following simple ```curl``` script to install Docker on Ubuntu.
```
curl -s https://get.docker.io/ubuntu/ | sudo sh
```
[A more detailed set of installation instruction is available here](http://docs.docker.io/en/latest/installation/ubuntulinux/)

### OSX
To install Docker on osx, one of the best options currently is [docker-osx](https://github.com/noplay/docker-osx). docker-osx makes it easy to manage a virtual machine that manages a Docker daemon running on it.

To install docker-osx...

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html).

2. Put the `docker-osx` script somewhere on your path:

```curl https://raw.github.com/noplay/docker-osx/master/docker-osx > /usr/local/bin/docker-osx
chmod +x /usr/local/bin/docker-osx```

3. Run:

```docker-osx shell
docker version```

### Windows
Currently not supported. Your best bet is to boot up a Vagrant machine with Ubuntu and follow the Linux installation above. The Docker team has more information about [Getting Started on Windows](http://docs.docker.io/en/latest/installation/windows/)

Installing fig.
---------------
[fig](https://github.com/orchardup/fig) is python package and easy to install with pip.
```
pip install -r requirements-dev.txt
```

Running the development environment.
====================================
To start all the services running, run...
```
fig up
```
If Docker is setup correctly, fig will handle building all Docker images/files.


Feedback, bugs?
=================
Please report any bugs/feedback/ideas through the GitHub issues.