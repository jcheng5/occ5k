#!/bin/sh

staticmatic build website
rsync -rPt --delete --exclude=.idea --exclude=.DS_Store website/ overlake@overlake5k.org:/home/overlake/overlake5k.org/
