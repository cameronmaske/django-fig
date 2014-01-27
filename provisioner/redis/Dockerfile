FROM ubuntu:12.04
MAINTAINER Cameron Maske "cam@trackmaven.com"

# If you update the version, make sure the redis.conf matches the version!
# Most like here (change the VERSION number!) -> https://raw.github.com/antirez/redis/2.8/redis.conf
ENV REDIS_VERSION 2.8.4

RUN apt-get -y install wget make gcc tcl sudo
RUN wget http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz -O - | tar -xvz
RUN cd /redis-$REDIS_VERSION && make && make test
RUN cp /redis-$REDIS_VERSION/src/redis-server /redis-$REDIS_VERSION/src/redis-cli /redis-$REDIS_VERSION/src/redis-benchmark /usr/local/bin

ADD config/redis.conf /etc/redis/redis.conf

# Update + remove unnecessary packages
RUN apt-get update
RUN apt-get autoremove -y

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

VOLUME ["/data"]

EXPOSE 6379
CMD ["usr/local/bin/run"]
