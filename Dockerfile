#  Uncomment for x86 based systems
#FROM alpine
#  Uncomment for Rasperry Pi and other ARM
FROM arm32v6/alpine

RUN apk --update del php5

RUN apk add \
  nextcloud-sqlite \
  php7-fpm

RUN sed -i "s/:${GID}:/:40:/g" /etc/group && \
  addgroup -g $GID -S $UNAME && \
  adduser -u $UID -D -S -G $GID $UNAME && \
  chown -R $UID:$GID /usr/share/webapps/nextcloud && \
  mkdir /data && \
  chown -R $UID:$GID /data && \
  chmod 0770 /data

USER $UNAME

WORKDIR /usr/share/webapps/nextcloud

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

VOLUME ["/data", "/usr/share/webapps/nextcloud/config"]
EXPOSE 8080
