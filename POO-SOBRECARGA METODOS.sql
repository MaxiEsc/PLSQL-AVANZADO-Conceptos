--Sobrecarga de operadoers de objetos
--Bueno como en la programacion orientada objetos un metodo cuyo nombre sea igual con  omportamientos distinto en este caso ejemplo sera con calcular un descuento de impuesto.
-- Habilitar la consola de la base de datos
--HEADER
--
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
--MEMBER FUNCTION ver_precio(impuesto NUMBER) RETURN NUMBER,
--MEMBER PROCEDURE cambiar_precio (precio NUMBER),
--STATIC PROCEDURE auditoria,
--
----Constructor
--CONSTRUCTOR FUNCTION producto(n1 VARCHAR2) RETURN SELF AS RESULT
--);
--
--BODY
--
--create or replace TYPE BODY producto AS 
--    MEMBER FUNCTION ver_producto RETURN VARCHAR2 AS 
--        BEGIN 
--            RETURN 'Codigo: ' || codigo || ' Nombre: ' || nombre || ' Precio: ' || precio;
--        END ver_producto;
--
--    MEMBER FUNCTION ver_precio(impuesto NUMBER) RETURN NUMBER AS
--        BEGIN
--            RETURN precio - precio*impuesto/100;
--        END ver_precio;
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
SET SERVEROUTPUT ON;
DECLARE
    prod3 producto;
BEGIN
    prod3 := producto(101,'Sandias',10);--Este constructor a pesar de haber creado el otro sigue funcionando
    DBMS_OUTPUT.PUT_LINE('Precio en descuento: ' || prod3.ver_precio(50));
    DBMS_OUTPUT.PUT_LINE('Precio: ' || prod3.ver_precio());
    prod3.cambiar_precio(20);
    DBMS_OUTPUT.PUT_LINE('Precio en descuento: ' || prod3.ver_precio(50));
    DBMS_OUTPUT.PUT_LINE('Precio: ' || prod3.ver_precio());
END;