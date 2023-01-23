FROM alpine

RUN apk add frp --no-cache

# ARG CONNECT_PORT=7000
# ARG CONNECT_TOKEN=123456
# ARG DASH_PORT=7001
# ARG DASH_USER=admin
# ARG DASH_PASSWD=admin

RUN echo "[common]"                       >  /etc/frps.ini &&\
    echo "bind_port = ${CONNECT_PORT}"    >> /etc/frps.ini &&\
    echo "token = ${CONNECT_TOKEN}"       >> /etc/frps.ini &&\
    echo "dashboard_port = ${DASH_PORT}" >> /etc/frps.ini &&\
    echo "dashboard_user = ${DASH_USER}"  >> /etc/frps.ini &&\
    echo "dashboard_pwd = ${DASH_PASSWD}" >> /etc/frps.ini

EXPOSE 80 443 ${CONNECT_PORT} ${DASH_PORT} 10000-65535

ENTRYPOINT /usr/bin/frps -c /etc/frps.ini
