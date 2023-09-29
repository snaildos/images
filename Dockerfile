FROM        debian:10-slim

LABEL       author="SnailDOS" maintainer="snaildos@snaildos.com"

USER        root

RUN         apt update \
            && apt -y install iproute2 git ca-certificates dnsutils tzdata zip tar curl build-essential libssl-dev libtool toilet toilet-fonts \
            && useradd -m -d /home/container container

RUN         chmod 000 /usr/bin/fallocate

RUN         chmod 000 /bin/dd

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
