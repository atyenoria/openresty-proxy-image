cp tmp.conf nginx.conf
sed -i -e "/server \$s1/c\server ${S1_PORT_3306_TCP_ADDR}:3306;" nginx.conf
sed -i -e "/server \$s2/c\server ${S2_PORT_3306_TCP_ADDR}:3306;" nginx.conf
bash -i -c "ng nginx.conf"
