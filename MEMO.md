# compile option
root@46cbeb9cbf3f:/opt/openresty/nginx/test# nginx -V
nginx version: openresty/1.9.7.3
built by gcc 4.9.2 (Debian 4.9.2-10)
built with OpenSSL 1.0.1k 8 Jan 2015
TLS SNI support enabled
configure arguments: --prefix=/opt/openresty/nginx --with-cc-opt=-O2 --add-module=../ngx_devel_kit-0.2.19 --add-module=../echo-nginx-module-0.58 --add-module=../xss-nginx-module-0.05 --add-module=../ngx_coolkit-0.2rc3 --add-module=../set-misc-nginx-module-0.29 --add-module=../form-input-nginx-module-0.11 --add-module=../encrypted-session-nginx-module-0.04 --add-module=../srcache-nginx-module-0.30 --add-module=../ngx_lua-0.10.0 --add-module=../ngx_lua_upstream-0.04 --add-module=../headers-more-nginx-module-0.29 --add-module=../array-var-nginx-module-0.04 --add-module=../memc-nginx-module-0.16 --add-module=../redis2-nginx-module-0.12 --add-module=../redis-nginx-module-0.3.7 --add-module=../rds-json-nginx-module-0.14 --add-module=../rds-csv-nginx-module-0.07 --with-ld-opt=-Wl,-rpath,/opt/openresty/luajit/lib --http-client-body-temp-path=/var/nginx/client_body_temp --http-proxy-temp-path=/var/nginx/proxy_temp --http-log-path=/var/nginx/access.log --error-log-path=/var/nginx/error.log --pid-path=/var/nginx/nginx.pid --lock-path=/var/nginx/nginx.lock --http-fastcgi-temp-path=/var/nginx/fastcgi --http-scgi-temp-path=/var/nginx/scgi --http-uwsgi-temp-path=/var/nginx/uwsgi --with-pcre-jit --with-ipv6 --with-stream --with-stream_ssl_module --with-http_ssl_module --without-http_ssi_module --without-http_userid_module --without-http_uwsgi_module --without-http_scgi_module --add-module=/var/cache/nginx/ngx_pagespeed --add-module=/var/cache/nginx/nginx_upstream_check_module



# client check
# cert1 が使われている
$ openssl s_client -quiet -connect localhost:443 -servername cert1.example.com --debug
depth=0 /C=JP/ST=Osaka/L=Osaka-shi/O=HiganWorks LLC./CN=cert1.example.com

# cert2 が使われている
$ openssl s_client -quiet -connect localhost:443 -servername cert2.example.com
depth=0 /C=JP/ST=Osaka/L=Osaka-shi/O=HiganWorks LLC./CN=cert2.example.com