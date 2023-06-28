--JSON en la Base de datos de Oracle con PLSQL desde oracle 21c con arreglos
CREATE TABLE productos(
codigo INT,
nombre VARCHAR2(200),
datos JSON
);
--Lectura basica de la tabla
SELECT * FROM productos;
--Lectura recomendada para JSON
SELECT p.datos.ciudad FROM productos p;
--Ejemplo 1 con JSON y arreglos de JSON
INSERT INTO productos VALUES (1, 'Ejemplo 2', '{
                                                "pais":"Colombia",
                                                "ciudad":"Bogota",
                                                "poblacion":"6000000",
                                                "direccion": {
                                                             "calle": "San Martin 123" ,
                                                             "edificio" : "5" ,
                                                             "piso" : "10" 
                                                             } , 
                                                "telefonos" : [
                                                               "123-345678",
                                                               "456-324561",
                                                               "987-212354",
                                                               "432-970640"
                                                              ]
                                                }'
);
--Mas alias
SELECT * FROM productos ;
--Arreglos en PLSQL 
SELECT prod.datos.telefonos[1] FROM productos prod;
