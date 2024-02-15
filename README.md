# MTLS request via plugin PoC
This PoC demonstrates the issue of client certificates not being provided by APISIX when issuing a mTLS request from a Lua plugin using  `resty.http`.
To make this PoC fully self contained the server used for testing is a separate Nginx server running inside the APISIX config. This server is bound to a unix domain socket.

In practice this issue manifests itself not only using unix domain sockets but also when listening to a ip address using both internal and external servers.

## Generate key material
The provided key material for this test has been generated as follows:
generate CA private key:
```shell
openssl genrsa -des3 -out myCA.key 2048 #passphrase: test
```

generate CA root certificate:
```shell
openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem
```

generate server private key:
```shell
openssl genrsa -out test.server.key 2048
```

generate server CSR:
```shell
openssl req -new -key test.server.key -out test.server.csr
```

sign server CSR:
```shell
openssl x509 -req -in test.server.csr -CA myCA.pem -CAkey myCA.key \
-CAcreateserial -out test.server.crt -days 825 -sha256
```
generate client private key:
```shell
openssl genrsa -out test.client.key 2048
```

generate client CSR:
```shell
openssl req -new -key test.client.key -out test.client.csr
```

sign client CSR:
```shell
openssl x509 -req -in test.client.csr -CA myCA.pem -CAkey myCA.key \
-CAcreateserial -out test.client.crt -days 825 -sha256
```
This repository acts as a template for developing custom plugins for APISIX. It used the APISIX docker container to test and run the plugins locally so no local install of APISIX is needed. 

## Usage
In order to use this template click `Use this template` and create your own repository based on this template. 

### Layout and customizations
The template runs APISIX in standalone mode, so no ETCD is needed. 
There are three subdirectories of this template:
- conf
- openresty
- src

The `conf` directory contains the configuration files for APISIX to run and configure in standalone mode. The template offers a minimal configuration to get you up and running. 

The `src` directory contains the source code for the custom plugin. Here you can place your lua files and subdirecties for developing your custom plugin. For more information regarding the development of a custom APISIX plugin see the official docs: https://apisix.apache.org/docs/apisix/plugin-develop/

the `openresty` directory contains the similar setup using vanilla Openresty instead of APISIX. 

The directories mentioned above are mounted in the container as follows:
conf/config.yaml -> /usr/local/apisix/conf/config.yaml
conf/apisix.yaml -> /usr/local/apisix/conf/apisix.yaml
logs/ -> /usr/local/apisix/logs
src/ -> /usr/local/apisix/custom-plugins

### Running your local plugin
APISIX containing your custom configuration and plugin are run using the APISIX Docker container. While perfectly possible to use the Docker CLI to run APISIX a Makefile is created for convenience. 

The Makefile contains the following commands:
- dev-startup -> creates and start the docker container with the appropriate volume mounts
- dev-start -> starts an existing container
- dev-stop -> stops the container
- dev-rm -> removes the container
- dev-reload -> issues the `apisix reload` command inside the container

When the container is started a container with the name of `apache-apisix-standalone-test` is run. 

To run the container:
```shell
make dev-startup
```