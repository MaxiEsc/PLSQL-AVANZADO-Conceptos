--Palabra reservada SELF en programacion orientada a objetos  SELF funcion similar al this para recibir a si mismo
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
--END;
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE
    prod1 producto;
BEGIN
    prod1 := producto(200, 'Manzana', 10);
    DBMS_OUTPUT.PUT_LINE(prod1.ver_producto());
--    prod1.nombre := 'Uvas';
    prod1.cambiar_precio(40);
    DBMS_OUTPUT.PUT_LINE(prod1.ver_producto());
END;