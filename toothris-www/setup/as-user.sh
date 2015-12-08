#!/bin/bash

set -e

. /toothris-www/setup/share.sh

# artificial-sweetener.xm
cd /toothris-www/run
curl -o artificial_sweetener.xm \
  "http://api.modarchive.org/downloads.php?moduleid=148808"
echo "915f6f8bf309a512e53faa98503c1978  artificial_sweetener.xm" | md5sum -c

# cc by-nc-sa icon
cd /toothris-www/www
curl -o cc-by-nc-sa.png "https://licensebuttons.net/l/by-nc-sa/4.0/80x15.png"
echo "9ce59a5ce18dd03f5abb439834d2451e  cc-by-nc-sa.png" | md5sum -c

# grunt-cli
sudo npm install -g grunt-cli@0.1.13

# bootstrap
git clone https://github.com/twbs/bootstrap /toothris-www/bootstrap.git
cd /toothris-www/bootstrap.git
git checkout v3.3.4
npm install

# jquery
mkdir /toothris-www/jquery
cd /toothris-www/jquery
npm install jquery@1.11.2

# stackless-python2
fetch-aur stackless-python2
# TODO: remove after updating to 2015-12-10
git checkout 3018124
git apply /toothris-www/setup/stackless-python2/the.patch
makepkg -sc --noconfirm
yes | sudo pacman -U stackless-python2-2.7.9-1-x86_64.pkg.tar.xz
rm stackless-python2-2.7.9-1-x86_64.pkg.tar.xz

# python2-rabbyt
fetch-aur python2-rabbyt
# TODO: remove after updating to 2015-12-10
git checkout 5797d07
makepkg -sc --noconfirm
sudo pacman -U --noconfirm python2-rabbyt-0.8.3-1-x86_64.pkg.tar.xz
rm python2-rabbyt-0.8.3-1-x86_64.pkg.tar.xz

# toothris
git clone https://github.com/toothris/toothris /toothris-www/toothris.git
cd /toothris-www/toothris.git
git checkout 1.0.1
cd /toothris-www/toothris.git/pkg/archlinux
makepkg -sc --noconfirm
sudo pacman -U --noconfirm toothris-1.0.1-1-any.pkg.tar.xz
rm toothris-1.0.1-1-any.pkg.tar.xz

# libxmp
fetch-aur libxmp
git apply /toothris-www/setup/libxmp/the.patch
makepkg -sc --noconfirm
sudo pacman -U --noconfirm libxmp-4.3.9-1-x86_64.pkg.tar.xz
rm libxmp-4.3.9-1-x86_64.pkg.tar.xz

# xmp
fetch-aur xmp
git apply /toothris-www/setup/xmp/the.patch
makepkg -sc --noconfirm
sudo pacman -U --noconfirm xmp-4.0.10-1-x86_64.pkg.tar.xz
rm xmp-4.0.10-1-x86_64.pkg.tar.xz

# ffmpeg-libfdk_aac
fetch-aur ffmpeg-libfdk_aac
git apply /toothris-www/setup/ffmpeg-libfdk_aac/the.patch
makepkg -sc --noconfirm
sudo pacman -U --noconfirm ffmpeg-libfdk_aac-1:2.7.2-4-x86_64.pkg.tar.xz
rm ffmpeg-libfdk_aac-1:2.7.2-4-x86_64.pkg.tar.xz
