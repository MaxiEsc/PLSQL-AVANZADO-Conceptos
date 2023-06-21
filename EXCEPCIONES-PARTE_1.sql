--Excepciones - Concepto mas profundizacion

--manejo de errores, para controlar posibles errores, ya sea generada por excepciones que mayormente son ocacionadas a proposito

-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE 
    emple employees%ROWTYPE;
BEGIN
--    SELECT * INTO emple FROM employees
--    WHERE employee_id > 1;
----    WHERE employee_id = 1000; -> No hay datos
--    
--      DBMS_OUTPUT.PUT_LINE(10/0);
--    DBMS_OUTPUT.PUT_LINE(emple.first_name);
     INSERT INTO departments VALUES(10, 'prueba',200,2000);
--BLoque de excepciones     
EXCEPTION
--Ejemplo puede llevar una funcion, procedimiento, etc.
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: EMPLEADO NO EXISTE');    
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: DEMASIADOS EMPLEADOS');   
    WHEN ZERO_DIVIDE  THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: DIVISION POR CERO NO EXISTE');   
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: VALOR DUPLICADO EN LA LLAVE FORANEA');      
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: NO DEFINIDO, COMUNICARSE CON SOPORTE');   
        NULL;
END;

--Las excepciones predefinidas: son las que mas son producidas en los programas
--1 -> NO DATA FOUND No hay datos
--2 -> TOO_MANY ROWS un select devuelve mas de lo que se pide
--3 -> ZERO_DIVIDE Dividir entre cero
--4 -> DUP_VAL_ON_INDEX cuando se manipula una llave primaria en una tabla

--Las excepciones predefinidas: son las que mas son producidas en los programas
