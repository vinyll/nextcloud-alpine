# Alpine image running Nextcloud

This image was initially created for being so simple that you would understand
what happens in a snap!

It runs an light Alpine Linux, installs PHP7 and the Nextcloud package and
runs a small PHP web server on port 8080. That's it.

It run on any Linux or OSX, but its purpose is to be installable on a
Raspberry Pi 3 and other ARM based computers.


### Installation

The image is not on the Docker Hub. You need to clone this repo instead and
build the image. You may then create the container.
All this can be done with the following:

```sh
git clone https://github.com/vinyll/nextcloud-alpine.git
cd nextcloud-alpine
docker build --tag nextcloud-alpine .
docker-compose up -d
```


Things to do:
- run an nginx instead of the PHP server (better for production)
- offer to install a mysql version instead of the current sqlite
