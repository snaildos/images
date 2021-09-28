# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        python:3-alpine

LABEL       author="SnailDOS" maintainer="snaildos@snaildos.com"

RUN         apk add --no-cache --update \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container

RUN         apk delete fallocate

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]
