--Rellenar campos del arreglo de tipo tabla-valor.

----Ejercicio 1 : rellenar campos del array-table clave valor con cursor en este caso con nombre de los departamentos
---- Habilitar la consola de la base de datos
--SET SERVEROUTPUT ON;
--
--DECLARE
--    TYPE departamentos IS TABLE OF departments.department_name%TYPE
--    INDEX BY PLS_INTEGER;
--    
--    depas departamentos;
--    
--    CURSOR cur_dts IS SELECT * FROM departments;
--    x PLS_INTEGER := 1;
--    
--    BEGIN
----Carga los nombres en el array
--    FOR dep IN cur_dts LOOP
--    depas(x) := dep.department_name;
--    x := x + 1;
--    END LOOP;
--    
--    FOR i IN 1..x-1 LOOP
--    DBMS_OUTPUT.PUT_LINE( depas(i) );
--    END LOOP;
--END;
--------------------------------------------------------------------------------------------------------------------------------
--Ejercicio 2: 
SET SERVEROUTPUT ON;

DECLARE
    TYPE departamentos IS TABLE OF departments.department_name%TYPE
    INDEX BY PLS_INTEGER;
    
    depas departamentos;
    
    CURSOR cur_dts IS SELECT * FROM departments;
    x PLS_INTEGER := 1;
    
    TYPE empleados IS TABLE OF employees%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    emplea empleados;
    
    CURSOR cur_empl IS SELECT * FROM employees e 
                        WHERE e.salary > 5000 ORDER BY e.employee_id DESC;
    y PLS_INTEGER := 1;
    
    BEGIN
--Carga los nombres en el array
    FOR dep IN cur_dts LOOP
    depas(x) := dep.department_name;
    x := x + 1;
    END LOOP;
    
--Muestra los valores de los campos    
    FOR i IN 1..x-1 LOOP
    DBMS_OUTPUT.PUT_LINE( depas(i) );
    END LOOP;
    
--Para cargar el arreglo clave-valor
    FOR emp IN cur_empl LOOP
        emplea(y) := emp;
        y := y + 1;
    END LOOP;
    
-- Muestra los valores del nuevo arreglo clave-valor
    FOR a IN 1..y-1 LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || emplea(a).employee_id || ' |-> ' || emplea(a).first_name || ' ' || emplea(a).last_name || ' ()->  Sueldo:  $' || emplea(a).salary );
    END LOOP;
END;
