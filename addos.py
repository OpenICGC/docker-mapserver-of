#!/usr/bin/env python
import sys
import os
from subprocess import call

#http://betaserver.icgc.cat/geoservice/289213657262513444877732435960631588437?layer=of25cv33sd0f241156s1r070&mode=tile&tilemode=gmap&tile={x}+{y}+{z}

if __name__ == '__main__':
    ovr_fname = fname = sys.argv[1]
    out_fname = sys.argv[2]
    levels = int(sys.argv[3])
    for l in range(levels):
        call(['gdaladdo', '-ro', '-r', 'gauss', 
            '--config', 'COMPRESS_OVERVIEW', 'PACKBITS', 
            '--config', 'GDAL_CACHEMAX', '25%', 
            '--config', 'BIGTIFF', 'YES', 
            ovr_fname, '2'])
        ovr_fname += ".ovw"
    call(['gdal_translate', fname,  out_fname, 
          '-co', 'TILED=YES', 
          '-co', 'BIGTIFF=YES', 
          '-co', 'COPY_SRC_OVERVIEWS=YES',
          '-co', 'COMPRESS=DEFLATE'])




    print fname

