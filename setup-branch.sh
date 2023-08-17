#!/bin/sh
git fetch --all --quiet
if git rev-parse --quiet --verify "origin/$1" >/dev/null
then
  git stash --include-untracked
  stash_ref=$(git stash create)
  work_branch=$(git symbolic-ref --short HEAD)
  git switch $1
  git merge --squash --strategy-option=theirs --allow-unrelated-histories $work_branch
  git stash apply "$stash_ref"
  git reset HEAD -- .
else
  git switch --orphan $1
fi
