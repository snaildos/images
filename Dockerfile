FROM        node:10-alpine

LABEL       author="SnailDOS" maintainer="zarasoonich@hotmail.com"

RUN         apk add --no-cache --update libc6-compat ffmpeg git make gcc g++ python build-base cairo-dev jpeg-dev pango-dev giflib-dev sqlite-dev sqlite-libs sqlite lolcat \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
