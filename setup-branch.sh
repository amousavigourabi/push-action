#!/bin/sh
git fetch --all --quiet
if git rev-parse --quiet --verify "origin/$1" >/dev/null
then
  git switch $1
  git pull origin $1
else
  git switch --orphan $1
fi
