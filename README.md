
# Descripció

Imatge de docker per a guardar la configuració del docker amb mapserver per a
la publicació de la ortofoto, i utilitats necessàries per a generar-les.

El docker que hem escollit es basa amb mapserver funcionant com a mòdul fastcgi
darrere d'un lighthttpd. En principi és la configuració recomanada per a tenir
més velocitat.

# Instruccions

Si fem sudo `run.sh`, arrenquem el servidor. Es pot comprovar que la
configuració ha anat OK amb l'script `query.sh`, que crida al capabilities
(comprovar si cal modificar la URL del servidor).

Per a afegir la capa des de QGis per provar, podem fer:

Añadir Capa WMS > Url: http://rasdaman:5000/cgi-bin/mapserv?map=/dades/of25c/of25c.map

Després ens deixarà escollir les layers.

# Configuració

El servidor anirà a buscar uns arixus de configuració. El mapeig de directoris
es fa desde l'arxiu `run.sh`, però en el repo de git bàsicament són a:

- `dades/of25c/of25c.map`: Arxiu de configuració del mapserver.
- `lighthttpd.conf`: Arxiu de configuració del lighthttpd (inclou configuració
per fer que mapserve corri amb fastcgi).


A l'arxiu de configuració se li passa un índex de tiles amb les imatges que s'han de servir. Això es fa amb els campsÑ

- SHAPEPATH que indica el paths amb els shapes.
- TILEINDEX "tileindex_ovr.shp", dins de cada Layer.

Aquests índexos es poden generar amb la GDAL, passant-li un directori d'arixus.
Per això tenim l'arxiu `gdal_buildindex.sh`, que obre un docker amb la GDAL
2.2.4 i executa l'arxiu `dades/index.sh`, que és el que fa la indexació.



