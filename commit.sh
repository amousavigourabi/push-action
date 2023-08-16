#!/bin/sh
if [ "$2" == "true" ]
then
  git commit --allow-empty -m "$1" -m "Empty"
elif ! git diff --cached --quiet --exit-code
then
  git commit -m "$1"
fi

