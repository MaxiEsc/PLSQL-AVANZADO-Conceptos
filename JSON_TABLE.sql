--JSON_TABLE(campo_json.lists_de_columnas);
--Esta para resolver el problema de resultado regrese en tipo JSON
--Esto nos permitira trabajar con el formato tabla caracteristicos de JSON
--leer el archivo en cuestion
SELECT pr.datos FROM productos1 pr;
--leer de la manera en base a la tabla ¡¡¡¡NOTA!!! El Prefijo debe ser "$"
SELECT j_pais FROM productos1 prod, JSON_TABLE(prod.datos, '$' COLUMNS (j_pais PATH '$.pais'));
--Anteriormente devolvimos una columna de paises... ahora incluyamos la ciudad - No funciona con arrays ni con valores anidados, SOLO VALORES ESCALARES
SELECT j_pais,j_ciudad FROM productos1 prod, JSON_TABLE(prod.datos, '$' COLUMNS (j_pais PATH '$.pais', j_ciudad PATH '$.ciudad'));
-- En este caso busquemos valores de array para justificar lo de arriba... La columna nos devuelve NULL, 
SELECT j_pais,j_ciudad,j_direccion FROM productos1 prod, JSON_TABLE(prod.datos, '$' COLUMNS (j_pais PATH '$.pais', j_ciudad PATH '$.ciudad', j_direccion PATH '$.direccion'));
-- En este caso busquemos valores del array en cuestion, los valores escalares ... La columna nos devuelve NULL en ños que no lo tengan, 
SELECT j_pais,j_ciudad,j_direccion FROM productos1 prod, JSON_TABLE(prod.datos, '$' COLUMNS (j_pais PATH '$.pais', j_ciudad PATH '$.ciudad', j_direccion PATH '$.direccion.calle'));

-- |UTILIDADES| --

CREATE VIEW datos_direccion AS 
SELECT j_pais,j_ciudad,j_direccion FROM productos1 prod, 
JSON_TABLE(prod.datos, '$' COLUMNS 
(j_pais PATH '$.pais', j_ciudad PATH '$.ciudad', j_direccion PATH '$.direccion.calle'));

SELECT * FROM datos_direccion;


