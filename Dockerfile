FROM alpine:3.3
MAINTAINER Ryan Schlesinger <ryan@outstand.com>

RUN apk add --no-cache \
      curl \
      jq

COPY wait.sh /wait.sh
CMD ["/wait.sh"]
