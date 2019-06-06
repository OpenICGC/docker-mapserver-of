#!/bin/bash
# ./mount_drives.sh
#	-v /mnt/uatd_proces:/dades/datacloud \
	# -e DEBUG:3 \
docker stop ms_ecw
docker rm ms_ecw
docker run -d -p 8080:80 \
	-v "/home/geoproces/docker-mapserver-of/dades/of25c/orto25c.map:/orto25c.map" \
	-v "/dades2/:/dades/" \
	-v "/home/geoproces/docker-mapserver-of/fcgid.conf:/etc/apache2/mods-enabled/fcgid.conf" \
	-v "/dades2/log/:/var/log/:rw" \
	-v "/dades2/log/apache2:/var/log/apache2:rw" \
	-e "MIN_PROCS=3" -e "MAX_PROCS=10" -e "MAX_LOAD_PER_PROC=4" -e "IDLE_TIMEOUT=20" \
	--cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH \
	--security-opt seccomp=unconfined --privileged \
        --restart unless-stopped \
	--name ms_ecw \
	daiko/mapserver-ecw 
