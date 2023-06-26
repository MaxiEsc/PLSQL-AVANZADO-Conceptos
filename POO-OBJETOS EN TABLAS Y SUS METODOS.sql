--Usar objetos para las tablas
--Creacion de la tabla de tienda
CREATE TABLE tienda(
codigo NUMBER, 
estateria NUMBER,
producto producto
);
--Analisar la tabla
DESC tienda;
--crear secuencia de la tienda
CREATE SEQUENCE seq_tienda
START WITH 1 
INCREMENT BY 1
MAXVALUE 9999
MINVALUE 1
CYCLE;
--ingresar un elemento a la tabla tienda con elemento producto
INSERT INTO tienda VALUES(seq_tienda.NEXTVAL,10,producto(100,'Limon',90)); 
--leemos el elemetno ingresado
SELECT * FROM tienda;
--No se puede acceder a elemento sin el alias.
--SELECT producto.precio FROM tienda ;
--Seleccionar al elemento tienda CON ALIAS
SELECT t.producto.precio FROM tienda t;
--Trabajar con los metodos
SELECT t.producto.ver_producto() FROM tienda t;
--No todos los metodos son validos para la consulta, los que realizan actualizacion, eliminaciones y demas