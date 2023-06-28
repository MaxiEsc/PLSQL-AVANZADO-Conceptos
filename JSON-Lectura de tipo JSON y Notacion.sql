--Recordando en este archivo retomamos el JSON en la Base de datos de Oracle con PLSQL desde oracle 21c
--Funcionalidades en Oracle 21c 
--Antes se usaba de esta manera con VARCHAR2(2000) O BLOB O CLOB
--CREATE TABLE productos(
--codigo INT,
--nombre VARCHAR2,
--datos VARCHAR2(2000)
--CONSTRAINT c1 CHECK (DATOS IS JSON)
--);
--Crear tabla para el JSON
CREATE TABLE productos(
codigo INT,
nombre VARCHAR2(200),
datos JSON
);
--Descripcion de la tabla productos
--DESC productos;
----EN este caso nos controla el archivo JSON y controla la valides del mismo Ejemplo 1
--INSERT INTO productos VALUES (1, 'Ejemplo 1', '{"pais":"Mexico",
--                                                "ciudad":"Monterey",
--                                                "poblacion":"9000000"}'
--);
----Ejemplo 2 con JSON
--INSERT INTO productos VALUES (1, 'Ejemplo 2', '{"pais":"España",
--                                                "ciudad":"Madrid",
--                                                "poblacion":"7000000"}'
--);
--Lectura basica de la tabla
SELECT * FROM productos;
--Lectura recomendada para JSON
SELECT p.datos.ciudad FROM productos p;
--Ejemplo 3 con JSON y listas de JSON
INSERT INTO productos VALUES (1, 'Ejemplo 2', '{"pais":"Colombia",
                                                "ciudad":"Bogota",
                                                "poblacion":"6000000",
                                                "direccion": {
                                                             "calle": "San Martin 123" ,
                                                             "edificio" : "5" ,
                                                             "piso" : "10" 
                                                             }
                                                }'
);
--Mas alias
SELECT q.datos.direccion.calle FROM productos q;
SELECT q.datos.direccion.edificio FROM productos q;
SELECT q.datos.direccion.piso FROM productos q;