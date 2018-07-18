#!/bin/bash
mkdir -p /dades/datacloud
mount -t cifs //84.88.72.86/datacloud_cifs 	/mnt/datacloud_cifs	-o username=dacloud_rd,password=58Qaqg321

docker run -it --rm -v "$PWD/of25c.map:/of25c.map" -p 5000:5000 \
	-v /mnt/datacloud_cifs:/dades/datacloud \
	-v /var/log:/var/log:rw \
	-v $PWD/dades:/tmp:rw \
	--cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH \
	--security-opt seccomp=unconfined --privileged \
	mapserver 
	-c '/bin/bash'
