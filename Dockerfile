FROM alpine

RUN apk add frp --no-cache

copy start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80 443 10000-65535

ENTRYPOINT /start.sh
