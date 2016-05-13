# docker-secret

Secret resource container like Secret Resource of Kubernetes

## Usage

```
docker run \
  -it \
  -e EXAMPLE_JSON=$BASE64_ENCODED_JSON \
  -e SECRETS="EXAMPLE_JSON=example.json" \
  -v "/secret" \
  syoya/secret
```
