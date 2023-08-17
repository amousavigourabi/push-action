#!/bin/sh
git fetch --all --quiet
git stage -A .
stash_ref="$(git stash create)"
work_branch=$(git symbolic-ref --short HEAD)
if git rev-parse --quiet --verify "origin/$1" >/dev/null
then
  git switch $1
else
  git switch --orphan $1
  git commit --allow-empty -m "Initialize branch"
fi
git merge --squash --strategy-option=theirs --allow-unrelated-histories $work_branch
if [ -n "$stash_ref" ]
then
  git stash apply $stash_ref
fi
git reset HEAD -- .
