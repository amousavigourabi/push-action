#!/bin/sh
git fetch --all --quiet
if git rev-parse --quiet --verify "origin/$1" >/dev/null
then
  git stash --all
  git switch $1
  git stash pop
else
  git switch --orphan $1
fi
