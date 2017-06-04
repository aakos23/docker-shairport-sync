## This file was forked from kevineye/docker-shairport-sync

FROM debian:9
MAINTAINER @aakos

RUN apt-get update \
 && apt-get install -y \
    libtool \
    autoconf \
    build-essential \
    git \
    libdaemon-dev \
    libasound2-dev \
    libpopt-dev \
    libconfig-dev \
    avahi-daemon \
    libavahi-client-dev \
    libssl-dev \
    libsoxr-dev \
 && rm -rf /var/lib/apt/lists/*

RUN cd /root \
 && git clone https://github.com/mikebrady/shairport-sync.git \
 && cd /root/shairport-sync \
 && autoreconf -i -f \
 && ./configure --with-alsa --with-pipe --with-avahi --with-ssl=openssl --with-soxr --with-metadata \
 && make \
 && make install

COPY start.sh /start

ENV AIRPLAY_NAME Docker

ENTRYPOINT [ "/start" ]
