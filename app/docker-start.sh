#!/bin/bash
set -e

echo "*** STARTING DOCKERGEN ***"
docker-gen -config /app/docker-gen.cfg

cat /app/lexicon.txt
