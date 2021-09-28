FROM        node:14-buster-slim

LABEL       author="SnailDOS" maintainer="zarasoonich@hotmail.com"

USER        root

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 python3 ca-certificates dnsutils build-essential \
            && useradd -m -d /home/container container

RUN         chmod 000 /usr/bin/fallocate

RUN         chmod 000 /bin/dd

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
