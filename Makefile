dev-startup:
	docker run -d --name apache-apisix-standalone-test \
  	-p 9080:9080 \
	-v $(shell pwd)/conf/config.yaml:/usr/local/apisix/conf/config.yaml \
	-v $(shell pwd)/conf/apisix.yaml:/usr/local/apisix/conf/apisix.yaml \
	-v $(shell pwd)/certs/myCA.pem:/usr/local/apisix/conf/ca.pem \
	-v $(shell pwd)/certs/test.server.crt:/usr/local/apisix/conf/cert/cert.crt \
	-v $(shell pwd)/certs/test.server.key:/usr/local/apisix/conf/cert/test.server.key \
	-v $(shell pwd)/src:/usr/local/apisix/custom-plugins \
	-v $(shell pwd)/lib:/usr/local/apisix/custom-plugin-libs \
	--add-host=host.docker.internal:host-gateway \
  	apache/apisix:3.8.0-debian

dev-start:
	docker start apache-apisix-standalone-test

dev-stop:
	docker stop apache-apisix-standalone-test

dev-rm:
	docker rm apache-apisix-standalone-test

dev-reload:
	docker exec -it apache-apisix-standalone-test apisix reload

dev-shell:
	docker exec -it apache-apisix-standalone-test /bin/bash