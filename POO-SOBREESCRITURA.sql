--Sobreescritura de metodos
--Se comprende la nueva clausula overriding Reescribiendo los siguientes objetos
--COMESTIBLES HEAD
create or replace TYPE comestibles UNDER producto(
--Atributos
caducidad date,
--Metodos
MEMBER FUNCTION ver_caducidad RETURN VARCHAR2,
OVERRIDING MEMBER FUNCTION ver_precio RETURN NUMBER
);
--FIN del HEAD
--COMESTIBLES BODY
create or replace TYPE BODY comestibles AS 
MEMBER FUNCTION ver_caducidad RETURN VARCHAR2 AS 
    BEGIN
        RETURN caducidad;
    END;
OVERRIDING MEMBER FUNCTION ver_precio RETURN NUMBER 
AS
    BEGIN
        RETURN precio + 10;
    END;
END;
--FIN del BODY
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON

DECLARE
    valor1 comestibles;
BEGIN
    valor1 := comestibles(500,'Papas',200,SYSDATE()+1);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || valor1.ver_producto());
     DBMS_OUTPUT.PUT_LINE('Precio en lista: ' || valor1.ver_precio());
    DBMS_OUTPUT.PUT_LINE('Precio sin impuesto: ' || valor1.ver_precio(20));
    DBMS_OUTPUT.PUT_LINE('caducidad: ' || valor1.ver_caducidad());
END;
--Eliminar objetos
DROP TYPE comestibles;
DROP TYPE producto;