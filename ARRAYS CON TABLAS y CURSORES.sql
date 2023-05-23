-- COLECCIONES: COMO LLENAR ARRAYS CON TABLAS
--
--Llenar con valores mas complejos extrañendo datos de una tabla.

-- Habilitar la consola de la base de datos
-- Ejercicio 01: En este caso como ejercicio rellenamos el array con los datos de la tabla departmaent
--SET SERVEROUTPUT ON;
--
--DECLARE 
----Declaramos un array como tabla que sea del formato del campo de tipo nombre y su indice sea un entero
--    TYPE departamentos IS TABLE OF departments.department_name%TYPE
--    INDEX BY PLS_INTEGER;
----Lo inicializamos como depa
--    depa departamentos;
----Esta vez utilizamos un cursor que arranque en 1
--    CURSOR cur_dep IS SELECT * FROM departments;
----Aqui creamos un variable de tipo PLS_Integer ya que es el indice de la tabla array
--    f PLS_INTEGER := 1; 
--    
--    BEGIN
---- Este es nuestro bucle que utilizaremos para que aloje los datos con f como clave de datos 
--        FOR dep IN cur_dep LOOP
--            depa( f ) :=  dep.department_name;
--            f := f + 1;
--        END LOOP;
--        
----Ahora lo inicializamos
--        FOR i IN 1..f-1 LOOP
--        DBMS_OUTPUT.PUT_LINE(depa( i ));
--        END LOOP;
--END;        
--            
--------------------------------------------------------------------------------------------------------------------------------
--Ejercicio 2: Exrtaer datos desde la tabla. cursor con select + where

-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE
    TYPE empleados IS TABLE OF employees%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    emple empleados;
    
    CURSOR cur_emp IS SELECT * FROM employees
    WHERE salary > 5000;
    
    z PLS_INTEGER :=1 ;
    
BEGIN
    FOR emp IN cur_emp LOOP
        emple(z) := emp;
        z := z + 1;
    END LOOP;
    
    FOR i IN 1..z-1 LOOP
        DBMS_OUTPUT.PUT_LINE(emple(i).employee_id || ' -> ' || emple(i).first_name || ' ' || emple(i).last_name || ' |->  $' || emple(i).salary );
    END LOOP;
END;
    
    




    



