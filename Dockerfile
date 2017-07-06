FROM ubuntu:16.04
MAINTAINER Wilfried JEANNIARD <willou.com@gmail.com>

RUN apt-get update \
  && apt-get install -y wget python-pip \
  && pip install --upgrade pip \
  && pip install dns-lexicon \  
  && rm -rf /var/lib/apt/lists/*

# Install docker-gen
ENV DOCKER_GEN_VERSION 0.7.3
RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

COPY app /app
RUN chmod +x /app/docker-entrypoint.sh /app/docker-start.sh


ENV DOCKER_HOST unix:///tmp/docker.sock

ENTRYPOINT ["bash","/app/docker-entrypoint.sh"]
CMD ["/app/docker-start.sh"]
