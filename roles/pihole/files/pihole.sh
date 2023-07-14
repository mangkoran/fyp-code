podman run \
	-d \
	--name=pihole \
	-e TZ=Asia/Kuala_Lumpur \
	-e DNSMASQ_LISTENING=all \
	-e QUERY_LOGGING=true \
	-e WEBPASSWORD=password \
	-v ./etc-pihole:/etc/pihole \
	-v ./etc-dnsmasq.d:/etc/dnsmasq.d \
	-v ./var-log:/var/log \
	-p 53:53/tcp \
	-p 53:53/udp \
	-p 80:80/tcp \
	--restart=always \
	docker.io/pihole/pihole:latest

podman run \
	-d \
	--name=vector \
	\
	-v ./etc-dnsmasq.d:/etc/dnsmasq.d:ro \
	-p 8686:8686 \
	--restart=always \
	docker.io/timberio/vector:latest-alpine # -v $PWD/vector.toml:/etc/vector/vector.toml:ro \
