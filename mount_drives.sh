#!/bin/bash
mkdir -p /dades/datacloud
mkdir -p /mnt/datacloud_2
mkdir -p /mnt/uatd_proces

mount -t cifs //172.17.21.250/uatd_proces	/mnt/uatd_proces -o username=geoproces,password='User123$'
#XXX: Qoju q aquest no va
#mount -t cifs //84.88.72.86/datacloud_cifs 	/mnt/datacloud_cifs	-o username=dacloud_rd,password=58Qaqg321
mount -t cifs //172.17.27.84/datacloud_2 	/mnt/datacloud_2	-o username=geoproces,password='User123$'


