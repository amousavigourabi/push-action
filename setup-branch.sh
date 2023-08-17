#!/bin/sh
git fetch --all --quiet
if git rev-parse --quiet --verify "origin/$1" >/dev/null
then
  echo "aaaaaaaa"
  ls -la
  git stash --include-untracked
  stash_ref=$(git stash create)
  work_branch=$(git symbolic-ref --short HEAD)
  echo "eeeeeeee"
  ls -la
  git switch $1
  echo "iiiiiiii"
  ls -la
  git merge --squash --strategy-option=theirs --allow-unrelated-histories $work_branch
  echo "oooooooo"
  ls -la
  git stash apply "$stash_ref"
  echo "uuuuuuuu"
  ls -la
  git reset HEAD -- .
else
  git switch --orphan $1
fi
