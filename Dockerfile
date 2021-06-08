FROM postgres:10.6-alpine

RUN apk add --no-cache curl tar
RUN mkdir -p /usr/src/eventide \
  && curl -L https://github.com/message-db/message-db/archive/refs/tags/v1.2.6.tar.gz -o /usr/src/eventide/message-db.tgz
RUN tar -xf /usr/src/eventide/message-db.tgz --directory /usr/src/eventide

COPY rundbscripts.sh /docker-entrypoint-initdb.d/

ENV PGDATA /data
RUN docker-entrypoint.sh postgres --version

ENTRYPOINT docker-entrypoint.sh postgres

