#!/bin/bash

set -e

TMPDIR=/var/tmp/toothris-www
RESDIR=/toothris-www/toothris.git/src/res/game

# main static content
cp /toothris-www/www/* $TMPDIR

# bootstrap
cd /toothris-www/bootstrap.git
git checkout .
git apply /toothris-www/setup/bootstrap/bootstrap.patch
grunt dist
cp -r /toothris-www/bootstrap.git/dist/* $TMPDIR

# jquery
cp -r /toothris-www/jquery/node_modules/jquery/dist/cdn/* $TMPDIR

# pics
convert $TMPDIR/oleg.jpg -rotate 90 -resize 160x120 $TMPDIR/oleg-sm.jpg
convert $TMPDIR/sshot.bmp $TMPDIR/sshot.jpg

convert $RESDIR/128x128_bonus_super_drop.png \
  -background "#00286D" -alpha remove \
  -resize 64x64 $TMPDIR/bonus-super-drop.jpg
convert $RESDIR/128x128_event_drop.png \
  -background "#00286D" -alpha remove \
  -resize 64x64 $TMPDIR/action-drop.jpg
