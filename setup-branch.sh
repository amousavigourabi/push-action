#!/bin/sh
git fetch --all --quiet
if git rev-parse --quiet --verify "origin/$1" >/dev/null
then
  ls
  git stash --include-untracked
  work_branch=$(git symbolic-ref --short HEAD)
  git switch $1
  ls
  git checkout "$work_branch" -- .
  ls
  git merge --squash --strategy-option=theirs --allow-unrelated-histories stash
  ls
  git stash drop
  git reset HEAD -- .
  ls
else
  git switch --orphan $1
fi
