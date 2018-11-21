#!/bin/bash
# ./mount_drives.sh
#	-v /mnt/uatd_proces:/dades/datacloud \
	# -e DEBUG:3 \
docker run -d -p 80:5000 \
	-v "/home/geoproces/docker-mapserver-of/dades/of25c/orto25c.map:/orto25c.map" \
	-v "/dades/:/dades/" \
	-v "$PWD/lighttpd.conf:/lighttpd.conf" \
	-v "$PWD/dades/log/:/var/log/" \
	--cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH \
	--security-opt seccomp=unconfined --privileged \
        --restart unless-stopped \
	--name ms \
	thingswise/mapserver:latest 
