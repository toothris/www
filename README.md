# Toothris Homepage

Homepage build automation for [Toothris](http://www.toothris.org).
It's a reproducible build: all dependencies versions are frozen.
Among other things, it builds gameplay video from the prerecorded demo using
the actual game code, so it can be used as a reference when building the
[game](https://github.com/toothris/toothris).
At the end it deploys everything to Amazon S3.
Whole process is quite long, may take an hour or so. Video generation
requires about 15 GB at `/var/tmp/toothris-www`.

## How to Build

Install Docker.

Clone this repo:
   `git clone https://github.com/toothris/www <<<path-to-repo>>>`

Create config file at `/etc/toothris-www/config.sh`:
```
AWS_ACCESS_KEY_ID="<<<amazon aws access key>>>"
AWS_SECRET_ACCESS_KEY="<<<amazon aws secret key>>>"
AWS_DEFAULT_REGION="<<<region, e.g. us-east-1>>>"
S3_BUCKET="<<<s3 bucket to deploy to, e.g. mytoothris>>>"
```

Run `<<<path-to-repo>>>/run.sh`

## License

The contents of this repo is licensed under MIT License.

## Contact

Oleg Plakhotniuk: contact@toothris.org
