# Toothris Homepage

Homepage build automation for [Toothris](http://www.toothris.org).
This is a reproducible build: all dependencies versions are frozen.
Among other things, it builds gameplay video from the prerecorded demo using
the actual game code, so it can be used as a reference when building the
[game](https://github.com/toothris/toothris).
In the end it deploys everything to the Git repo.
Whole process is quite long, may take an hour or so. Video generation
requires about 15 GB at `/var/tmp/toothris-www`.

## How to Build

Install [Docker](https://www.docker.com/).

Clone this repo:
   `git clone https://github.com/toothris/www <<<path-to-repo>>>`

Create config file at `/etc/toothris-www/config.sh`:
```
GIT_REPO='<<<git repo to deploy to, e.g. git@github.com:toothris/toothris.github.io.git>>>'
GIT_USER='<<<git user name, e.g. James T. Kirk>>>'
GIT_EMAIL='<<<git user email, e.g. kirk@enterprise.uss'
ID_RSA_PUB='<<<public ssh rsa key to access to the git repo>>>'
ID_RSA='<<<private ssh rsa key to access to the git repo>>>'
```

Run `<<<path-to-repo>>>/run.sh`

## License

The contents of this repo is licensed under MIT License.

## Contact

Oleg Plakhotniuk: contact@toothris.org
