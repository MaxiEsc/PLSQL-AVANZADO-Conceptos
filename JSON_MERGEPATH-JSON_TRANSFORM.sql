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
--Con JSON_TRANSFORM
UPDATE productos1 SET datos = JSON_TRANSFORM(datos, SET '$.ciudad' = 'Barcelona')
WHERE codigo = 2;
--SELECT CON JSON TRANSFORM
--En este caso le pido que me traiga los valores modificado de la tabla con la datos ya existentes. ademas 
SELECT JSON_TRANSFORM(datos, SET '$.poblacion'= 20000000) "Seleccion"
FROM productos1 WHERE codigo = 3;
--Aqui vemos que tal cual se transforma la salida de los datos como se le indica, si no existe lo crea
SELECT JSON_TRANSFORM(datos, SET '$.poblacion_BOSTA'= 999999999) "Seleccion Errornea"
FROM productos1 WHERE codigo = 3;
--EN este caso inserta una clave pero no se ingresa a la base pero si a la consulta
SELECT JSON_TRANSFORM(datos, INSERT '$.ubicacion'= 'Europa') "Seleccion con Insert"
FROM productos1 WHERE codigo = 2;
--APPEND
SELECT prod.datos.telefonos FROM productos1 prod;
--Con append Agregamos un valor en el arreglo
SELECT JSON_TRANSFORM(datos, APPEND '$.telefonos'= 158984516 ) "Seleccion con APPEND"
FROM productos1 WHERE codigo = 3;


