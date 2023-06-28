--Clausulas IS JSON, IS NOT JSON
--Son similiares is null is not null
--Tabla ejemplo
CREATE TABLE ejemplo(
codigo INT,
fichero CLOB
);
--Insert de prueba
INSERT INTO ejemplo VALUES (1,'{"columna1":"prueba"}');
--texto comun
INSERT INTO ejemplo VALUES (2,'Ejemplo de prueba');
--ejemplo de XML
INSERT INTO ejemplo VALUES (3,'<doc><columna1>prueba</columna></doc>');
--Solo valido para tablas en el formato CLOB,BLOB y VARCHAR2 ya que es el unico tipo de dato que permite la validaciones libres 
--Trae todos los ficheros que trae los ficheros que cumplen con el formato JSON 
SELECT * FROM ejemplo WHERE fichero IS JSON;
--Lo opuesto
SELECT * FROM ejemplo WHERE fichero IS NOT JSON;