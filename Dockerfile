FROM        python:3.9-slim

LABEL       author="SnailDOS" maintainer="snaildos@snaildos.com"

RUN         apt update \
            && apt -y install git gcc g++ ca-certificates cmake make dnsutils curl iproute2 ffmpeg procps zip toilet toilet-fonts \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
