--Practica con programacion en lotes

-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE
    valor VARCHAR2(400);
BEGIN
    SELECT prod.datos.poblacion INTO valor
    FROM productos1 prod WHERE codigo = 5;
    DBMS_OUTPUT.PUT_LINE(valor);   
    
    SELECT JSON_VALUE(prod.datos, '$.pais') INTO valor
    FROM productos1 prod WHERE codigo = 3;
    DBMS_OUTPUT.PUT_LINE(valor);
    
    SELECT JSON_VALUE(prod.datos, '$.direccion') INTO valor
    FROM productos1 prod WHERE codigo = 3;
    DBMS_OUTPUT.PUT_LINE(valor);
    
    SELECT JSON_VALUE(prod.datos, '$.direccion.calle') INTO valor
    FROM productos1 prod WHERE codigo = 3;
    DBMS_OUTPUT.PUT_LINE(valor);
    
    SELECT JSON_QUERY(prod.datos, '$.direccion.calle') INTO valor
    FROM productos1 prod WHERE codigo = 3;
    DBMS_OUTPUT.PUT_LINE(valor);
END;