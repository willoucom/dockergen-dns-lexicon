# dockergen-dns-lexicon

Small container using [docker-gen](https://github.com/jwilder/docker-gen) to generate a .sh file for [dns-lexicon]( https://github.com/AnalogJ/lexicon)

Designed to be used in conjunction with [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy)

## Usage

Use the following environment variables :

- LEXICON_IP : ip address of your choice
- LEXICON_PROVIDER : dns provider (see dns-lexicon documentation)
- LEXICON_ provider _ACCESS_KEY : see dns-lexicon documentation
- LEXICON_ provider _ACCESS_SECRET : see dns-lexicon documentation

don't forget to add a volume to the docker socket :

> -v /var/run/docker.sock:/tmp/docker.sock:ro
