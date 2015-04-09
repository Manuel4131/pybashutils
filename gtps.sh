#!/bin/bash

rdir=~/code/
cdir=$(pwd)
for cdr in $(find $rdir -mindepth 1 -maxdepth 1 -type d); do
cd $cdr
  if [[ -n `git --no-pager diff HEAD 2>/dev/null` ]]; then
    git diff HEAD
    git commit -a
    git push
    sleep 0.$[ ($RANDOM % 1000)]
  fi
done
cd $pwd