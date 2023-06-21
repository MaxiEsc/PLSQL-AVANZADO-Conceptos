--Programacion Orientada a objetos PLSQL ORACLE
--Oracle es una base de datos de tipo relacional y entonecs no es una base de datos de tipo objetos.
--Aunque con el tiempo se fueron introduciendo funcionalidades que permiten trabajar con algunas caracteristicas de las bases de datos orientadas a objetos.
--las caracteristicas de la base de datos representa la informacion mediante objetos, que son similares a los que se utilizan en los mismo lenguajes

--Creando la cabecera de un objeto como la cabecera de una clase
CREATE OR REPLACE TYPE producto AS OBJECT(

--ATRIBUTOS
codigo NUMBER,
nombre VARCHAR2(100),
precio NUMBER,

--METODO
MEMBER FUNCTION ver_producto RETURN VARCHAR2,
MEMBER FUNCTION ver_precio RETURN NUMBER,
MEMBER PROCEDURE cambiar_precio (pvp NUMBER)
);

----Para borrar la cabecera o el type
--DROP TYPE producto;
--
--Creacion del cuerpo de la clase u objeto
CREATE OR REPLACE TYPE BODY producto AS 
    MEMBER FUNCTION ver_producto RETURN VARCHAR2 AS 
        BEGIN 
            RETURN 'Codigo: ' || codigo || ' Nombre: ' || nombre || ' Precio: ' || precio;
        END ver_producto;

    MEMBER FUNCTION ver_precio RETURN NUMBER AS
        BEGIN
            RETURN precio;
        END ver_precio;

    MEMBER PROCEDURE cambiar_precio(pvp NUMBER) AS 
        BEGIN 
            precio := pvp;
        END cambiar_precio;
END;

--Probar el objeto creado
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE 
    valor1 producto;
BEGIN
    valor1 := producto(100, 'Manzanas', 10);
    DBMS_OUTPUT.PUT_LINE(valor1.ver_precio());
    DBMS_OUTPUT.PUT_LINE(valor1.ver_producto());
    DBMS_OUTPUT.PUT_LINE('Cambiar Precio!!');    
    valor1.cambiar_precio(20);
    DBMS_OUTPUT.PUT_LINE(valor1.ver_producto());
END;



