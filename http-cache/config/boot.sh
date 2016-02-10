cp tmp.conf nginx.conf
sed -i -e "/server \$s1/c\server ${S1_PORT_80_TCP_ADDR};" nginx.conf
# sed -i -e "/server \$s2/c\server ${S2_PORT_80_TCP_ADDR};" nginx.conf
bash -i -c "ng nginx.conf"
