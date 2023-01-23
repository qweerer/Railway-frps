
echo "[common]"                       >  /etc/frps.ini
echo "bind_port = ${CONNECT_PORT}"    >> /etc/frps.ini
echo "dashboard_port = ${DASH_PORT}"  >> /etc/frps.ini
echo "token = ${CONNECT_TOKEN}"       >> /etc/frps.ini
echo "dashboard_user = ${DASH_USER}"  >> /etc/frps.ini
echo "dashboard_pwd = ${DASH_PASSWD}" >> /etc/frps.ini

/usr/bin/frps -c /etc/frps.ini
