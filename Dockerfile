FROM alpine

RUN apk update && apk add bash imagemagick && apk add curl
WORKDIR /home/matias/entorno/TP

ADD scripts/ scripts

ENTRYPOINT ["bash", "scripts/menu.sh"]

