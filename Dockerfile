FROM ruby:2

RUN \
  apt-get update -y && \
  apt-get install -y \
    jq

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

WORKDIR /usr/src/secret

ARG yaml=secret.yml
COPY $yaml ./secret.yml

RUN \
  mkdir -p /secret && \
  json=$(ruby -e "require 'yaml'; require 'json'; puts JSON.pretty_generate YAML.load_file 'secret.yml'") && \
  data=$(echo $json | jq -r ".data") && \
  names=$(echo $data | jq -r ". | keys | .[$i]") && \
  for name in $names; do \
    value=$(echo $data | jq -r ".[\"$name\"]"); \
    content=$(echo $value | base64 --decode); \
    echo $content > /secret/$name; \
  done; \
  ls -al /secret
