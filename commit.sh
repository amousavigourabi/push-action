#!/bin/sh
if [ "$2" = "true" ] || ! git diff --cached --quiet --exit-code
then
  git commit --allow-empty -m "$1"
fi

