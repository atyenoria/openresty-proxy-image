cp tmp.conf nginx.conf
sed -i -e "/server \$app1/c\server ${APP1_PORT_80_TCP_ADDR};" nginx.conf
sed -i -e "/server \$app2/c\server ${APP2_PORT_80_TCP_ADDR};" nginx.conf
bash -i -c "ng nginx.conf"
