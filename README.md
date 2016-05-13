# docker-secret

Secret resource container like Secret Resource of Kubernetes

## Usage

```
$ export BASE64_ENCODED_JSON=`echo '{"foo":"bar}' | base64`
$ docker run \
    -it \
    -e EXAMPLE_JSON=$BASE64_ENCODED_JSON \
    -e SECRETS="EXAMPLE_JSON=example.json" \
    -v "/secret" \
    syoya/secret
$ docker exec -it c76 cat /secret/example.json
{"foo":"bar}
```

`SECRETS` can be specified multiple env-filename map with comma delimiter like `FILE_A=a.txt,FILE_B=b.txt,...`.
