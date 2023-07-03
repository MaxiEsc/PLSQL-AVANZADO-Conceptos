--JSON_MERGEPATH-JSON_TRANSFORM
--modificar el contenido de un campo de JSON
--Si bien no esta increible (solo nos permite actualizar determinedas caracteristicas del documento JSON)
--Tabla con la que trabajaremos con archivos JSON
SELECT * FROM productos1;
--Arreglar cagada
TRUNCATE TABLE productos1;
--Actualizacion de un JSON de menra comun
UPDATE productos1 SET datos = '{
                                "pais":"Argentina",
                                "ciudad":"Buenos Aires",
                                "poblacion":11000000
                                }'
                                WHERE codigo = 1;
--Actualizamos con un campo mas de clave                                
UPDATE productos1 SET datos = '{
                                "pais":"Argentina",
                                "ciudad":"Buenos Aires",
                                "poblacion":11000000,
                                "ubicacion":"America del sur"
                                }'
                                WHERE codigo = 1; 
--Actualizando con la clausula JSON_MERGEPATH
UPDATE productos1 SET datos = JSON_MERGEPATCH(datos, '{
                                                      "poblacion":8000000
                                                      }')
                                                      WHERE codigo = 1;
--Funcion o clausula JSON_TRANSFORM --SOLO PARA ORACLE 21c
--SET
--INSERT
--APPEND
--REMOVE
--RENAME
--REPLACE
--KEEP

UPDATE productos1 SET datos = JSON_TRANSFORM(datos, SET '$.ciudad' = 'Barcelona')
WHERE codigo = 2;
