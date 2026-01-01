FROM        node:18-bookworm-slim

LABEL       author="SnailDOS" maintainer="snaildos@snaildos.com"

USER        root

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libssl-dev libtool toilet toilet-fonts \
            && npm -g install npm@10.8.2 \
            && useradd -m -d /home/container container

RUN         chmod 000 /usr/bin/fallocate

RUN         chmod 000 /bin/dd

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
