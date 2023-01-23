FROM alpine

RUN apk add frp --no-cache

RUN echo "[common]"                       >  /etc/frps.ini &&\
    echo "bind_port = ${CONNECT_PORT}"    >> /etc/frps.ini &&\
    echo "token = ${CONNECT_TOKEN}"       >> /etc/frps.ini &&\
    echo "dashboard_port = ${DASH_PORT}" >> /etc/frps.ini &&\
    echo "dashboard_user = ${DASH_USER}"  >> /etc/frps.ini &&\
    echo "dashboard_pwd = ${DASH_PASSWD}" >> /etc/frps.ini

EXPOSE 80 443 ${CONNECT_PORT} ${DASH_PORT} 10000-65535

ENTRYPOINT /var/frp/frps -c /var/frp/frps.ini
