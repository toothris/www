#!/bin/bash

set -e

BKGCOL="#00286D"
BONUSSIZE=64x64
TMPDIR=/var/tmp/toothris-www
RESDIR=/toothris-www/toothris.git/src/res/game

BONUSES="super_drop super_hit builder king_of_hill acid_rain hail earthquake"

ACTS="[ \
{'act': 'drop',    'fig': '096x096_s', 'ofs': '+16+0'}, \
{'act': 'float',   'fig': '096x096_s', 'ofs': '+16+0'}, \
{'act': 'frag',    'fig': '096x096_s', 'ofs': '+16+0'}, \
{'act': 'ground',  'fig': '096x096_s', 'ofs': '+16+0'}, \
{'act': 'hit',     'fig': '096x096_s', 'ofs': '+16+0'}, \
{'act': 'rotate',  'fig': '096x096_s', 'ofs': '+16+0'}, \
{'act': 'swallow', 'fig': '096x096_s', 'ofs': '+16+0'}]"
ACTSLEN=$(python2 -c "print len($ACTS)")

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

for BONUS in $BONUSES ; do
  convert $RESDIR/128x128_bonus_${BONUS}.png \
    -background $BKGCOL -alpha remove \
    -resize $BONUSSIZE $TMPDIR/bonus-${BONUS}.jpg
done

for (( ACTI=0; ACTI<ACTSLEN; ACTI++)) ; do
  ACT=$(python2 -c "print $ACTS[$ACTI]['act']")
  FIG=$(python2 -c "print $ACTS[$ACTI]['fig']")
  OFS=$(python2 -c "print $ACTS[$ACTI]['ofs']")
  convert $RESDIR/128x128_event_${ACT}.png \
    $RESDIR/${FIG}.png -geometry $OFS -composite \
    -background $BKGCOL -alpha remove \
    -resize $BONUSSIZE $TMPDIR/action-${ACT}.jpg
done
