#!/bin/sh
git fetch --all --quiet
if git rev-parse --quiet --verify "origin/$1" >/dev/null
then
  git stash --include-untracked
  git switch $1
  git merge --squash --strategy-option=theirs stash
  git stash drop
else
  git switch --orphan $1
fi
