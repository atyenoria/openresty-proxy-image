#docker build -t atyenoria/openresty-proxy . && docker run -it -p 80:80 -v $(pwd)/test:/opt/openresty/nginx/test --name openresty  --rm=true atyenoria/openresty-proxy bash
#docker build -t atyenoria/openresty-proxy . && docker run -it -p 80:80 -p 3306:3306 -v $(pwd)/test:/opt/openresty/nginx/test --name openresty  --rm=true --link=redis atyenoria/openresty-proxy bash
#docker build -t atyenoria/openresty-proxy . && docker run -it -p 80:80 --link=redis atyenoria/openresty-proxy bash

#nginx -c /etc/nginx/nginx.conf

#redis
#docker run -d -p 6379:6379 --name=redis atyenoria/redis-openresty
#docker run -it --link=redis --rm redis sh -c 'exec redis-cli -h "$REDIS_PORT_6379_TCP_ADDR" -p "$REDIS_PORT_6379_TCP_PORT"'
#set p5001.10.1.2.164.xip.io 172.17.0.37:5000
#mysql -h 192.168.99.100 -u root -proot -e "STATUS;"

FROM atyenoria/openresty-base


RUN /opt/openresty/luajit/bin/luarocks install lua-cjson
RUN /opt/openresty/luajit/bin/luarocks install md5


RUN mkdir -p /opt/openresty/nginx/logs
RUN touch /opt/openresty/nginx/logs/nginx.pid
RUN echo "alias ngx=\"nginx -c /etc/nginx/nginx.conf\"" >> ~/.bashrc
RUN echo "alias lso=\"lsof -i -n -P\"" >> ~/.bashrc

# COPY ./test /opt/openresty/nginx

CMD ["nginx", "-g", "daemon off; error_log /dev/stderr info;"]
# nginx -c /etc/nginx/nginx.conf
RUN echo "cd /opt/openresty/nginx/test" >> ~/.bashrc
RUN echo "alias r=\"resty\"" >> ~/.bashrc
RUN echo "alias ng=\"nginx -p /opt/openresty/nginx/test -c\"" >> ~/.bashrc



#RUN echo "alias ng=\"\"" >> ~/.bashrc

#luarocks
WORKDIR /opt/openresty/nginx