# docker 101

**00_how_to_docker** - introduction to Docker and its main options.

**01_dockerfiles** - writing dockerfiles:
* Alpine image with Vim editor.
* Debian TeamSpeak server.
* Ruby container for Rails applications.
* Debian with Gitlab server (SSL and SSH).

**02_bonus** - bonus dockerfiles:
* Debian web server (SSL)
* Debian with C dev environment
* Debian for basic network testing
* fun Debian with fortune | cowsay generated images
* Debian with Python3 dev environment

to run on MAC:
```docker-machine stop Char && VBoxManage modifyvm Char --cpus 2 && VBoxManage modifyvm Char --memory 4096 && docker-machine start Char && eval $(docker-machine env Char)```

Some useful resources:
- https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
- https://packages.gitlab.com/gitlab/gitlab-ce/install
- https://gitlab.com/gitlab-org/omnibus-gitlab/issues/430
- https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/
- https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-debian-9
