#!/bin/sh
git fetch --all --quiet
if git rev-parse --quiet --verify "origin/$1" >/dev/null
then
  git stash --include-untracked
  work_branch=$(git symbolic-ref --short HEAD)
  git switch $1
  git checkout "$work_branch" -- .
  git merge --squash --strategy-option=theirs --allow-unrelated-histories stash
  git stash drop
  git reset HEAD -- .
else
  git switch --orphan $1
fi
