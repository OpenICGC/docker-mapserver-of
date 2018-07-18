#!/bin/bash
#https://trac.osgeo.org/gdal/wiki/CloudOptimizedGeoTIFF#HowtoreaditwithGDAL
date
# Uns 20s
gdalbuildvrt -overwrite /dades/rasters/of5m.vrt -srcnodata 0 -vrtnodata 0 /dades/datacloud/of5m_ETRS89/tif_unzip/*.tif
#-co COMPRESS=JPEG -co PHOTOMETRIC=YCBCR 
date
# Unes 7h
gdal_translate -of GTiff -r cubic -tr 0.5 0.5 -a_nodata 0 \
	-co "TILED=YES" -co "BIGTIFF=YES" -co "COMPRESS=DEFLATE" \
	/dades/rasters/of5m.vrt /dades/rasters/of5m.tif
date
gdaladdo -r cubic /dades/rasters/of5m.tif 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192
date
gdal_translate /dades/rasters/of5m.tif /dades/rasters/of5m_cog.tif 
	-co "TILED=YES" -co "BIGTIFF=YES" -co "COPY_SRC_OVERVIEWS=YES" \
	-co "COMPRESS=JPEG" -co "PHOTOMETRIC=YCBCR" \
date


