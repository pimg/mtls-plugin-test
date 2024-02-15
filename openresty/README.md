# Openresty
This directory contains the same mTLS call, but created with "vanilla" Openresty.

In order to run this example Openresty and OPM must be installed on your machine.

Before starting the Openresty example install the `resty.http` library using OPM:
```shell
sudo opm get ledgetech/lua-resty-http
```

start the Openresty server, from within the `openresty` directory:
```shell
nginx -p `pwd`/ -c conf/nginx.conf
```

In order to test issue a http request to `http://localhost:8080/t`

