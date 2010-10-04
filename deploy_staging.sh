#!/bin/sh

staticmatic build website
rsync -rPt --delete --exclude=.idea --exclude=.DS_Store website/site/ jcheng1978@joecheng.com:/home/jcheng1978/joecheng.com/staging/occ5k/
