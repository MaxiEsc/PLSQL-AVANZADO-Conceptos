--Nueva clausula bulk Collect

-- Es un aconsultaque permite la carga de todos los datos en una tabla
--Ejercicio 1: Comparar las formas de realizar la carga y lectura de los array clave-valor o asociativos

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
    
--Si bien la funcion es la misma pero esta funcion de bulk collect es mas eficiente que con el cursor recorriendo lo todo la tabla
   SELECT * BULK COLLECT INTO emplea 
   FROM employees e 
   WHERE e.salary > 5000 ORDER BY e.last_name ASC;
    
-- En este caso del Bulk Collect  en este caso se recorre todo el valor TOTAL de lo guardado en el array asociativo
    FOR a IN 1..emplea.COUNT() LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || emplea(a).employee_id || ' |-> ' || emplea(a).first_name || ' ' || emplea(a).last_name || ' ()->  Sueldo:  $' || emplea(a).salary );
    END LOOP;
END;
