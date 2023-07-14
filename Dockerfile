FROM alpine

RUN apk update && apk add bash imagemagick

WORKDIR /app

ADD scripts scripts

ENTRYPOINT ["bash", "scripts/menu.sh"]

