#!/bin/sh
until git push origin $1
do
  git pull origin $1 --allow-unrelated-histories
done
