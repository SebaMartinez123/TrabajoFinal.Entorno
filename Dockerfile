FROM alpine

RUN apk update && apk add bash imagemagick && apk add curl && apk add --purge --no-cache --update gzip
WORKDIR /home/matias/entorno/TP

ADD scripts/ scripts
WORKDIR scripts
ENTRYPOINT ["bash", "menu.sh"]

