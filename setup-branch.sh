#!/bin/sh
git fetch --all
if ! git show-ref --verify --quiet "refs/heads/$1"
then
  git switch --orphan $1
fi
