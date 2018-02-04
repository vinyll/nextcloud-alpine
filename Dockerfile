#  Uncomment for x86 based systems
#FROM alpine
#  Uncomment for Rasperry Pi and other ARM
FROM arm32v6/alpine

RUN apk --update del php5

RUN apk add \
  nextcloud-sqlite \
  php7-fpm

RUN mkdir /data && \
  chown -R nextcloud:www-data /data && \
  chmod 0770 /data && \
  addgroup -g 1000 -S pi && \
  adduser -u 1000 -D -S -G pi pi

USER pi
WORKDIR /usr/share/webapps/nextcloud

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

VOLUME ["/data", "/usr/share/webapps/nextcloud/config"]
EXPOSE 8080
