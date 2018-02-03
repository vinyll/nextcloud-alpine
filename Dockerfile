FROM alpine


RUN apk --update del php5

RUN apk add \
  nextcloud-sqlite \
  php7-fpm

RUN mkdir /data && \
  chown -R nextcloud:www-data /data && \
  chmod 0770 /data && \
  chown -R nextcloud:www-data /usr/share/webapps/nextcloud

USER nextcloud
WORKDIR /usr/share/webapps/nextcloud

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

VOLUME ["/data"]
EXPOSE 8080
