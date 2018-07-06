#!/bin/bash
#gdalbuildvrt -overwrite /dades/ovw10.vrt -srcnodata 0 -vrtnodata 0 /dades/of25c/tileindex_ovr.shp /dades/datacloud/of25m_ETRS89/tif_unzip/*.tif
#-co COMPRESS=JPEG -co PHOTOMETRIC=YCBCR 
#gdal_translate -of GTiff -r cubic -tr 10 10 -a_nodata 0 -co "TILED=YES" -co "BIGTIFF=YES" /dades/ovw10.vrt /dades/ovw10.tif
gdaladdo -r cubic /dades/ovw10.tif 2 4 8 16 32 64 128 256 512 1024 2048 4096

