#!/bin/sh
git fetch --all
if git rev-parse --quiet --verify "$1" >/dev/null
then
  git switch $1
else
  git switch --orphan $1
fi
