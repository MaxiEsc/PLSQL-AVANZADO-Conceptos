--Nueva funcionalidad raise aplication error
--raise_aplication_error : es una funcionalidad que nos permite devolver un erro personalizado y cortar el programa

-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE
    region NUMBER;
    nombre VARCHAR2(200);
BEGIN
    region := 102;
    nombre := 'Antartida';
    --EL CODIGOD DEBE RONDAR ENTRE -20000 y -20999
    IF region > 100 THEN
        RAISE_APLICATION_ERROR(-20001, 'EL ID NO PUEDE SER MAYOR A 100');
    ELSE 
        INSERT INTO regions VALUES(region,nombre);
        COMMIT;
    END IF;
END;