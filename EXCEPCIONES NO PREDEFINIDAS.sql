--Las excepciones no predefinidas son situaciones de escepciones ocasionadas por nuestro programa  no por nuestro codigo.
--ya sea por la interaccion del usuario o la interaccion 
SET SERVEROUTPUT ON;

DECLARE
    miexception EXCEPTION;
    PRAGMA exception_init(miexception, -935);
    valor1 NUMBER;
    valor2 NUMBER;
BEGIN
      SELECT employee_id, SUM(salary) INTO valor1, valor2 FROM employees;
      DBMS_OUTPUT.PUT_LINE(valor1);
EXCEPTION
     WHEN miexception THEN
      DBMS_OUTPUT.PUT_LINE('ERROR: FUNCION DE GRUPO INCORRECTA');
    WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE('ERROR: NO ESPECIFICADO');
END;

--https://docs.oracle.com/en/database/oracle/oracle-database/19/errmg/O2U-00200.html#GUID-C1395BC8-4269-4F3D-B4D1-B0B2E0F672F4
--PRAGMA: exception_init Es una especie de orden que se le da al compilador del programa
--Dato curioso todos los codigos de errores de ORACLE son negativos.