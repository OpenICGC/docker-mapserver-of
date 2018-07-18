#!/bin/bash
./mount_drives.sh
#	-v /mnt/uatd_proces:/dades/datacloud \
docker run -v "$PWD/of25c.map:/of25c.map" -p 5000:5000 \
	-v /mnt/datacloud_2:/dades/datacloud \
	-v "$PWD/dades/:/dades/" \
	-v "/dades/rasters:/rasters/" \
	-v "$PWD/lighttpd.conf:/lighttpd.conf" \
	-e DEBUG:3 \
	-v "$PWD/dades/log/:/var/log/" \
	--cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH \
	--security-opt seccomp=unconfined --privileged \
	--name ms --rm \
	thingswise/mapserver:latest 
