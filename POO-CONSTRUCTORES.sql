--Metodo constructor 
--Nos permite inicializar el determinado objeto
--HEADER
--create or replace TYPE producto AS OBJECT(
--
----ATRIBUTOS
--codigo NUMBER,
--nombre VARCHAR2(100),
--precio NUMBER,
--
----METODO
--MEMBER FUNCTION ver_producto RETURN VARCHAR2,
--MEMBER FUNCTION ver_precio RETURN NUMBER,
--MEMBER PROCEDURE cambiar_precio (precio NUMBER),
--STATIC PROCEDURE auditoria,
--
----Constructor
--CONSTRUCTOR FUNCTION producto(n1 VARCHAR2) RETURN SELF AS RESULT
--);
--BODY
--
--create or replace TYPE BODY producto AS 
--    MEMBER FUNCTION ver_producto RETURN VARCHAR2 AS 
--        BEGIN 
--            RETURN 'Codigo: ' || codigo || ' Nombre: ' || nombre || ' Precio: ' || precio;
--        END ver_producto;
--
--    MEMBER FUNCTION ver_precio RETURN NUMBER AS
--        BEGIN
--            RETURN precio;
--        END ver_precio;
--
--    MEMBER PROCEDURE cambiar_precio(precio NUMBER) AS 
--        BEGIN 
--            SELF.precio := precio;
--        END cambiar_precio;
--        
--    STATIC PROCEDURE auditoria AS 
--    BEGIN 
--        INSERT INTO auditoria VALUES(USER, SYSDATE);
--    END;
--    
--    --Constructor
--    CONSTRUCTOR FUNCTION producto(n1 VARCHAR2) RETURN SELF AS RESULT
--    IS 
--        BEGIN
--            SELF.nombre := n1;
--            SELF.precio := NULL;
--            SELF.codigo :=sq1.NEXTVAL;
--            RETURN;
--        END;
--END;
--
--
--Creamos una secuencia para utilizar el constructor unico
--CREATE SEQUENCE sq1;
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;
DECLARE
    prod3 producto;
    prod4 producto;
BEGIN
    prod3 := producto(101,'Sandias',10);--Este constructor a pesar de haber creado el otro sigue funcionando
    prod4 := producto('Peras');
    DBMS_OUTPUT.PUT_LINE(prod3.ver_producto());
    DBMS_OUTPUT.PUT_LINE(prod4.ver_producto());
    prod3.cambiar_precio(20);
    DBMS_OUTPUT.PUT_LINE(prod3.ver_producto());
    producto.auditoria(); 
END;