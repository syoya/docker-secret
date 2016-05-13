#!/bin/bash

ORIG=$IFS
IFS=','
arr=($SECRETS)
IFS=$ORIG
for secret in ${arr[@]}; do
  IFS='='
  kv=($secret)
  IFS=$ORIG
  env=${kv[0]}
  file=${kv[1]}
  echo ${!env} | base64 --decode > $file
done
