--Herencia
--Clausula UNDER : Permite una solucion para la facilidad en el concepto de herencia de un objeto a otros.
--EL objeto debe cumplir con:
--No ser de tipo FINAL objeto que no puede ser heredable bajo ninguna condicion.
--NOT FINAL sobre la clase padre
--Esta clausula es importante añadirla en los objetos/clase de oracle para poder heredarlos
--Interezante el objeto puede crearse con acarreos de errores, lo que se significa que:
--Por mas que se soluciones el problema el mismo seguira con el error por o que hay que recrearlo de vuelta
--Creacion de clase hija o calificada para herehcia
CREATE OR REPLACE TYPE comestibles UNDER producto(
--Atributos
caducidad date,
--Metodos
MEMBER FUNCTION ver_caducidad RETURN VARCHAR2
);
----Codigo de body
CREATE OR REPLACE TYPE BODY comestibles AS 
MEMBER FUNCTION ver_caducidad RETURN VARCHAR2 AS 
    BEGIN
        RETURN caducidad;
    END;
END;
--Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;
DECLARE
    valor1 comestibles;
BEGIN
    valor1 := comestibles(500, 'Papas',200,SYSDATE()+ 1);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || valor1.ver_producto());
    DBMS_OUTPUT.PUT_LINE('Precio sin impuesto: ' || valor1.ver_precio(20));
    DBMS_OUTPUT.PUT_LINE('caducidad: ' || valor1.ver_caducidad());
END;
--
DROP type comestibles;
DROP TYPE producto;
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
--CONSTRUCTOR FUNCTION producto(n1 VARCHAR2) RETURN SELF AS RESULT)
--NOT FINAL
--;
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