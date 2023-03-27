FROM alpine

MAINTAINER ValeCloud

ENV RSLSYNC_SIZE=1024 \
    RSLSYNC_TRASH_TIME=0 \
    RSLSYNC_TRASH=false
COPY root/. /

RUN apk update && apk upgrade && \
    apk add zip curl && \
    cd /root && \
    curl https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz | tar xfz - && \
    mv rslsync /usr/local/bin && \
    rm -rf /var/cache/apk/*

VOLUME /data

EXPOSE 33333

