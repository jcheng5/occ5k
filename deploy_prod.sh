#!/bin/sh

staticmatic build website
rsync -rPt --delete --exclude=.idea --exclude=.DS_Store website/ occsoft@overlake5k.org:/home/occsoft/overlake5k.org/
