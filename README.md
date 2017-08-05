# Dockergen-dns-lexicon

Small container using [docker-gen](https://github.com/jwilder/docker-gen) to generate a .sh file for [dns-lexicon]( https://github.com/AnalogJ/lexicon)

Designed to be used in conjunction with [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy)

## Usage

Use the following environment variables :

- LEXICON_IP : ip address of your choice
- LEXICON_PROVIDER : dns provider (see dns-lexicon documentation)
- LEXICON_provider_ACCESS_KEY : see dns-lexicon documentation
- LEXICON_provider_ACCESS_SECRET : see dns-lexicon documentation

Don't forget to add a volume to the docker socket (container refuse to start without docker socket) :

> -v /var/run/docker.sock:/tmp/docker.sock:ro

Then use environment variable on your containers :
> -e VIRTUAL_HOST=mydomain.ext


## Docker-compose file example for AWS Route53

```
version: '2'
services:
  lexicon:
    build:
      context: .
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro
    environment:
      - LEXICON_IP=192.168.1.1
      - LEXICON_PROVIDER=route53
      - LEXICON_ROUTE53_ACCESS_KEY=key
      - LEXICON_ROUTE53_ACCESS_SECRET=secret

  nginx-proxy:
    image: jwilder/nginx-proxy
    ports:
      - "80:80"
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro

  whoami0:
    image: jwilder/whoami
    environment:
      - VIRTUAL_HOST=mydomain.ext
```
