#!/bin/bash
cd /var/www/exe.galaktik.io || exit
git fetch
HEADHASH=$(git rev-parse HEAD)
UPSTREAMHASH=$(git rev-parse master@{upstream})
if [ "$HEADHASH" != "$UPSTREAMHASH" ]
then
  git reset origin/master --hard
  echo '****STARTING DEPLOY****'
  echo `date '+%Y-%m-%d %H:%M:%S'`
  git pull 2>&1
  hugo
  echo '****ENDING DEPLOY****'
  exit 0
fi