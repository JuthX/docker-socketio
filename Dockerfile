FROM zzrot/alpine-node
MAINTAINER Vo Duy Tuan <tuanmaster2012@gmail.com>

RUN apk add --update \
    supervisor \
  && rm -rf /var/cache/apk/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN /bin/mkdir -p /srv/logs


RUN npm install --silent socket.io
RUN npm dedupe

WORKDIR /srv

EXPOSE 3000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

