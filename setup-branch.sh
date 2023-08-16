#!/bin/sh
git fetch --all --quiet
if git rev-parse --quiet --verify "origin/$1" >/dev/null
then
  git stash --include-untracked
  git switch $1
  git merge --squash --strategy-option=theirs --allow-unrelated-histories stash
  git stash drop
  git reset --soft HEAD~1
else
  git switch --orphan $1
fi
