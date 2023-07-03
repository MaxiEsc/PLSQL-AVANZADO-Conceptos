--Clausula JSON VALUE y JSON_QUERY
--JSON_VALUE(campo_json.expresion_json);
--Esta expresion nos permite accerder a un determinado valor de una propiedad de de los documentos JSON
--una caractreristica de esta clausula es que puede devolver una propiedad PERO no puede devolver un array o un documento 
--leer el documento JSON
SELECT * FROM productos1;
--En este caso con la clausula JSON_VALUE tenemos que respetar el prefijo con el grupo que queremos buscar en este caso los paises
SELECT JSON_VALUE(prod.datos, '$.pais') FROM productos1 prod;
--En este caso con la clausula JSON_VALUE tenemos que respetar el prefijo con el grupo que queremos buscar en este caso direccion
SELECT JSON_VALUE(prod.datos, '$.direccion') FROM productos1 prod;
--En este caso con la clausula JSON_VALUE tenemos que respetar el prefijo con el grupo que queremos buscar en este caso direccion con calle
SELECT JSON_VALUE(prod.datos, '$.direccion.calle') FROM productos1 prod;
--En este caso con la clausula JSON_VALUE tenemos que respetar el prefijo con el grupo que queremos buscar en este caso arreglo de telefono
SELECT JSON_VALUE(prod.datos, '$.telefonos[0]') FROM productos1 prod;
--JSON_QUERY(campo_json.expresion,expresion_json.on_error);
--funcionalidad similar a json_value pero permite recuperar un valor simple, permite recuperar arrays o documentos
SELECT p.datos FROM productos1 p;
--En este caso nos permite ver la lista de elementos que contengan datos con sus determinadas posiciones aqui con la direccion
SELECT JSON_QUERY(p.datos,'$.direccion') FROM productos1 p;
--En este caso nos permite ver la lista de elementos que contengan datos con sus determinadas posiciones, aqui con el piso
SELECT JSON_QUERY(p.datos,'$.direccion.piso') FROM productos1 p;
--En este caso nos permite ver la lista de elementos que contengan datos con sus determinadas posiciones, en este caso con el telefono
SELECT JSON_QUERY(p.datos,'$.telefonos[1]') FROM productos1 p;