#!/bin/bash

set -e

. /etc/toothris-www/config.sh

mkdir -p /home/user/.ssh
echo "$ID_RSA" > /home/user/.ssh/id_rsa
echo "$ID_RSA_PUB" > /home/user/.ssh/id_rsa.pub

cd /var/tmp/toothris-www
git init
git add .
git commit -m "Automatic deploy."
git remote add origin $WWW_GIT
git push -f origin master
